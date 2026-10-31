function _awabbre_internal_identifier-data_individual-info --no-scope-shadowing --argument-names=identifier --inherit-variable={internal_description_prefix,argparse} --description='Accept an identifier, and parse it to gather data into the outer scope'
    # WARNING
    # Make sure you erase the variable you use from the `local` scope, even when used in a `for` loop.
    # Not doing so would have the variables persist even outside the scope the function was called.
    # Example erasing all the variables: `set --erase --local -- bases initials subcommand expansion regex_scopes cursor_placeholder use_expander forget_prefixes regard_flags`

    # info embedded in identifier
    set --local -- escaped_identifier_positionals (
        string sub --start=4 -- {$identifier} |
        string split --max=1 -- '  ')
    set --function -- bases (
        commandline --tokens-expanded --input={$escaped_identifier_positionals[1]})
    begin
        set --local -- positionals (commandline --tokens-expanded --input={$escaped_identifier_positionals[2]})
        set --function -- initials {$positionals[..-2]}
        set --function -- subcommand {$positionals[-1]}
    end

    # info from internal description
    set --local -- identifier_description_var_name (
            string escape --style=var -- {$identifier}
        )_description
    set --query --local -- {$identifier_description_var_name} ||
        return 1 # only sets embedded information

    # remove variables from outside; restore them after operation
    set --local -- unwanted_superscope_variables _flag_{regex,set_cursor,expander,unprefix,regard_flags}
    for unwanted_superscope_var in {$unwanted_superscope_variables}
        set --query --local -- {$unwanted_superscope_var} ||
            continue
        set --function -- {$unwanted_superscope_var}_backup {$$unwanted_superscope_var}
        set --local --erase -- {$unwanted_superscope_var}
    end

    $argparse \
        r/regex=\* \
        c/set-cursor=? \
        e/expander \
        0/unprefix \
        s/regard-flags \
        -- (
            commandline --tokens-expanded --input=(
                string sub --start=(
                    math 1 + (
                        string length -- {$internal_description_prefix}
                    )) -- {$$identifier_description_var_name}))
    set --query --local -- _flag_regex &&
        set --function -- regex_scopes {$_flag_regex}
    set --query --local -- _flag_set_cursor &&
        set --function -- cursor_placeholder {$_flag_set_cursor}
    set --query --local -- _flag_expander &&
        set --function -- use_expander {$_flag_expander}
    set --query --local -- _flag_unprefix &&
        set --function -- forget_prefixes {$_flag_unprefix}
    set --query --local -- _flag_regard_flags &&
        set --function -- regard_flags {$_flag_regard_flags}

    # restore unwanted superscoped variables
    for unwanted_superscope_var in {$unwanted_superscope_variables}
        set --local -- backup_varname {$unwanted_superscope_var}_backup
        set --query --function -- {$backup_varname} &&
            set --function -- {$unwanted_superscope_var} {$$backup_varname}
        set --erase --function -- {$backup_varname}
    end

    set --function -- expansion {$argv}
end
