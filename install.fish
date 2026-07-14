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
        set --local proj_name fish-subAbbr
        # Clone repository to temporary directory
        set --global -- repository_dir (mktemp -- {$proj_name}-XXXXXXXXX)
        begin
            set --local clone_repo clone --filter=blob:none https://github.com/Drazape/{$proj_name}.git "$repository_dir"
            git $clone_repo || nix run nixpkgs#git $clone_repo || return 2
        end
        cd {$repository_dir}
    end
end

# Populate
for dir in functions completions conf.d
    for source in "$root_dir"{$dir}/**.fish
        set --local -- output_path {$source} # Same output path in case of no root directory
        set --query --local -- root_dir && set --local -- output_path (string split --fields=2 --max=1 -- "$root_dir" {$source}) # Remove root directory from the output path
        install -D --mode=644 -- {$source} "$out"/"$remote"share/fish/vendor_{$dir}.d/(string split --fields=2 --max=1 -- {$dir}/ {$output_path} | string replace --all -- / _ | string replace -- {,_}sub-abbr_)
    end
end
