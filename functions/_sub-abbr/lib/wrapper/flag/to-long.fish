function _sub-abbr_lib_wrapper_flag_to-long --description='Convert flags: short → long; Regex initials supported; chaining unsupported'
    argparse --name=(status current-function) --move-unknown 'm/mandatory&' -- {$argv}
    set --local -- initials {$argv[..-3]}
    set --local -- short_flag {$argv[-2]}
    set --local -- long_flag {$argv[-1]}

    set --function -- internal_expander _sub-abbr_internal_expander_flag_to-long
    if set --query --local -- _flag_mandatory
        set --function -- cursor {$internal_expander}_cursor
        _sub-abbr_lib_wrapper_flag_mandatory-long {$argv_opts} --flag={$long_flag} -- {$initials}
    end
    sub-abbr add --set-cursor={$cursor} --expander --regex=sub-command {$argv_opts} -- \
        {$initials} \
        (string escape --style=regex -- -{$short_flag}).\* \
        {$internal_expander}\ "$_flag_mandatory"\ --\ {$long_flag}\ "$cursor"
end
