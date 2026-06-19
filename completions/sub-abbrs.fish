set --local -- common_complete complete --command=sub-abbrs --no-files
$common_complete

function sub
    set --local -- path (commandline --tokens-expanded --current-process --cut-at-cursor)[2..]

    set --local -- parent_group _sub-abbr_pkg_"$(string join -- _ {$path} \0)"
    for subfunc in (string match --regex --entire -- ^(string escape --style=regex -- {$parent_group}) (functions --all) (path basename --no-extension {$fish_function_path}/*))
        set --local sub_path (string split --max=1 --fields=2 -- {$parent_group} {$subfunc} | string split -- _)
        echo -n {$sub_path[1]}
        argparse --ignore-unknown /description=+\& -- (commandline --tokens-expanded --input=(functions --no-details -- {$subfunc})[1])
        echo -n \t{$_flag_description}
        echo # Seperate new line from description, in case it doesn't exist
    end

end

$common_complete --arguments={$pkg} --arguments='(sub)'
