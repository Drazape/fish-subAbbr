#!/usr/bin/env fish
if test (count {$argv}) -ge 1
    set --function -- root_dir {$argv[1]}/
else
    set --function -- remote usr/local/
end

# get from the remote GitHub repository
if set --query --local -- remote
    if ! fish_is_root_user
        echo (status basename): 'Must be ran as root'
        return 1
    end
    # Setup Cleanup
    function cleanup_temporary_repository --description='Nuke temporary repository on exit' --on-event=fish_exit
        rm -rf -- {$repository_dir}
    end

    begin
        set --local -- proj_name fish-subAbbr
        set --local -- repository_dir /tmp/{$proj_name}-(random)
        git clone --filter=blob:none https://github.com/Drazape/{$proj_name}.git "$repository_dir" || return 2
        cd {$repository_dir}
    end
end

# Populate
set --local -- destination "$out"/"$remote"

for dir in functions completions
    for source in "$root_dir"{$dir}/**.fish
        set --local -- output_path {$source} # Same output path in case of no root directory
        set --query --local -- root_dir &&
            set --local -- output_path (string split --fields=2 --max=1 -- "$root_dir" {$source}) # Remove root directory from the output path
        install -D --mode=644 -- {$source} "$destination"share/fish/vendor_{$dir}.d/(
            string split --fields=2 --max=1 -- {$dir}/ {$output_path} |
            string replace --all -- / _
        )
    end
end

function place --description='install files into Fish hierarchy' --argument-names={source,target} --inherit-variable=destination
    set --local -- final_target "$destination"share/fish/{$target}
    mkdir --parents -- (path dirname -- {$final_target})
    cp --recursive -- "$rootdir"{$source} {$final_target}
end
place packages/ subAbbr-packages/official/
place conf.d/load-packages.fish vendor_conf.d/subAbbr:load-packages.fish
