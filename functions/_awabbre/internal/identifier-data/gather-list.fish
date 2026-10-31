function _awabbre_internal_identifier-data_gather-list --no-scope-shadowing --inherit-variable={identifier_prefix,identifier_start,prefix_length} --description='Gather identifiers and store their embedded data as requested'
    # let hooks change identifiers that are received. This can be useful for allowing the user to manage identifiers that are distributed in a conditional-loading way.
    emit -- awabbre_gather-identifiers {$argv}

    test "$argv" = commands &&
        set --local -- commands_flag '/commands=+&'
    contains -- commands
    for abbr in (abbr --show)
        if ! argparse --ignore-unknown {$commands_flag} '/description=&' '/function=&' -- (commandline --tokens-expanded --input={$abbr}) ||
                string match --quiet --invert -- {$identifier_prefix} (string sub --end={$prefix_length} -- {$_flag_function})
            continue
        end
        set --local -- identifier (
            string unescape --style=var -- (
                string sub --start={$identifier_start} -- {$_flag_function}))
        set --append --function -- identifiers {$identifier}
        set --local -- identifier_variable_prefix (string escape --style=var -- {$identifier})
        set --function -- {$identifier_variable_prefix}_description {$_flag_description}
        set --query --local -- commands_flag &&
            set --function -- {$identifier_variable_prefix}_commands {$_flag_commands}
    end
end
