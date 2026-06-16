set --local -- common_complete complete --command=sub-abbrs --no-files
$common_complete

for function in (string match --regex --entire -- '^_sub-abbr_pkg_' (path basename --no-extension -- {$fish_function_path}/*) (functions --all | string split -- ,\ ))
    argparse --ignore-unknown /description=+\& -- (commandline --tokens-expanded --input=(functions --no-details -- {$function} | string join0 | string split0 --fields=1))

    set --local -- pkg (string split --fields=2 -- _sub-abbr_pkg_ {$function})
    $common_complete --description={$_flag_description} \
        --arguments={$pkg} --condition='! __fish_seen_argument '{$pkg}
end
