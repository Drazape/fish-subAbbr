function _sub-abbr_lib_wrapper_flag_mandatory-long --description='Enforce input for value-required long flags'
    argparse --move-unknown --min-args=1 --name=(status current-function) 'f/flag=+&' -- {$argv}
    set --query --local -- _flag_flag || return 1

    set --function -- long_flag (string escape --style=regex -- {$_flag_flag})
    test (count {$_flag_flag}) != 1 && set --function -- long_flag \("$(string join -- \| {$long_flag})"\)

    set --local -- cursor (status current-function)_cursor
    sub-abbr add --expander --set-cursor={$cursor} --regex=sub-command {$argv_opts} -- {$argv} '\-\-'{$long_flag} _sub-abbr_internal_expander_flag_mandatory-long\ {$cursor}
end
