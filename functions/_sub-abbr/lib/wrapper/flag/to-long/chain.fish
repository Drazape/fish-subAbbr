function _sub-abbr_lib_wrapper_flag_to-long_chain --description='Convert flags: short → long; Regex initials unsupported; chaining supported'
    argparse --name=(status current-function) 'b/base=+' 'm/mandatory&' -- {$argv}
    set --local -- initials {$argv[..-3]}
    set --local -- short_flag {$argv[-2]}
    set --local -- long_flag {$argv[-1]}

    set --function -- internal_expander _sub-abbr_internal_expander_flag_to-long_chain
    set --function -- cursor {$internal_expander}_cursor
    set --query --local -- _flag_mandatory &&
        _sub-abbr_lib_wrapper_flag_mandatory-long --base={$_flag_base} --flag={$long_flag} -- {$initials}

    begin
        set --local -- escaped_bases (string escape --style=script --no-quoted -- {$_flag_base})
        set --local -- escaped_initials (string escape --style=script --no-quoted -- {$initials})
        # the prefix that is passed to the expander to know which variables to reference with context to the respective Sub-command match type, Base Commmand and Initial Arguments
        # this prefix is not parsed by the expander; the matching is already handled by `sub-abbr`
        set --function -- subabbr_shortToLong_prefix _subabbr_shortToLong_( # separate escaped lists with consequent unescaped spaces. It cannot be part of a token since the second space would always have `\` prefixed to it.
            string escape --style=var -- "$escaped_bases  $escaped_initials"
        )
        # if the expander encounters the short flag on the command-line, it references this variable to obtain the long flag.
        set --query --local -- _flag_mandatory &&
            set --local -- mandatory{,}
        set --global -- {$subabbr_shortToLong_prefix}_(
                string escape --style=var -- "$short_flag"
            ) {$long_flag} {$mandatory}
    end

    sub-abbr add --set-cursor={$cursor} --expander --regex=sub-command --base={$_flag_base} -- \
        {$initials} \
        '\-\w.*' \
        {$internal_expander}\ {$subabbr_shortToLong_prefix}
end
