function _sub-abbr_lib_wrapper_flag_to-long --description='Convert flags: short → long'
    argparse --name=(status current-function) --move-unknown 'm/mandatory&' -- {$argv}
    set --local -- initials {$argv[..-3]}
    set --local -- short_flag {$argv[-2]}
    set --local -- long_flag {$argv[-1]}

    if set --query --local -- _flag_mandatory
        set --function -- cursor (status current-function)_cursor
        _sub-abbr_lib_wrapper_flag_mandatory-long {$argv_opts} --flag={$long_flag} -- {$initials}
    end
    sub-abbr add --set-cursor={$cursor} --expander --regex=sub-command {$argv_opts} -- \
        {$initials} \
        (string escape --style=regex -- -{$short_flag}).\* \
        _sub-abbr_internal_expander_flag_to-long\ {$long_flag}\ "$cursor"
end
