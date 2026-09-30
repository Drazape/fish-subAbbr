begin
    set --local -- common_complete complete --command=sub-abbr --no-files
    function single-switch --description='Only suggest the switch once' --inherit-variable=common_complete
        argparse --move-unknown s/short-option= l/long-option= -- {$argv}
        $common_complete --condition='! __fish_seen_argument --short='{$_flag_short_option}' --long='{$_flag_long_option} {$argv_opts} -- {$argv}
    end

    $common_complete
    single-switch --short-option=h --long-option=help --description='Reference manuals' \
        --condition='set --local -- unbase (__fish_print_cmd_args_without_options)[2..3]
                 test (count {$unbase}) -eq 0 && return 0
                 test "$unbase[1]" = add && return 0
                 test "$unbase[1]" = identity && return 0
                 return 1'

    begin
        set --local -- subcommand_complete {$common_complete} --condition='test (__fish_number_of_cmd_args_wo_opts) -lt 2'
        $subcommand_complete --arguments=add --description='Create abbrs'
        $subcommand_complete --arguments=identity --description='Manage abbrs by their identifiers'
    end

    begin
        set --local -- identity_complete {$common_complete} \
            --condition='set --local -- unbase (__fish_print_cmd_args_without_options)[2..3]
                    test (count {$unbase}) -eq 1 && test "$unbase[1]" = identity && ! contains "$unbase[2]" list erase'
        $identity_complete --arguments=list --description='Get identifiers'
        $identity_complete --arguments=erase --description='Erase abbrs with identity'
    end
    $common_complete \
        --condition='set --local -- subcommands (__fish_print_cmd_args_without_options)[2..3]
                test "$subcommands[1]" = identity && test "$subcommands[2]" = erase' \
        --arguments='(sub-abbr identity list)'

    begin
        set --local -- list_complete_condition \
            --condition='set --local -- subcommands (__fish_print_cmd_args_without_options)[2..3]
            test "$subcommands[1]" = identity && test "$subcommands[2]" = list'

        function _subabbr_complete_list --argument-names=component
            argparse --move-unknown 'b/base=*&' 'm/match=&' 'r/regex&' -- (__fish_print_cmd_args)[4..]
            set --local -- commandline_positionals (__fish_print_cmd_args_without_options)[4..]
            if test {$component} = initials
                for matched_identifier in (sub-abbr identity list {$_flag_regex} --base={$_flag_base} --match={$_flag_match} -- {$commandline_positionals})
                    set --local -- identifier_positionals (commandline --tokens-expanded --input=(string split --fields=2 --max=1 -- '  ' {$matched_identifier}))
                    test (count {$identifier_positionals}) -le (count {$commandline_positionals}) &&
                        continue
                    echo {$identifier_positionals[(math 1 + (count {$commandline_positionals}))]}
                end
            else if test {$component} = base
                for matched_identifier_unfiltered_base in (sub-abbr identity list {$_flag_regex} --match={$_flag_match} -- {$commandline_positionals})
                    for found_base in (string repeat -- 1 (commandline --tokens-expanded --input=(string split --{fields,max}=1 -- '  ' {$matched_identifier_unfiltered_base}))[2..])
                        contains -- {$found_base} {$_flag_base} ||
                            echo {$found_base}\t(type --type -- {$found_base})
                    end
                end
            end
        end
        $common_complete {$list_complete_condition} --arguments='(_subabbr_complete_list initials)'
        # not using `single-switch` since a value is mandatory
            $common_complete {$list_complete_condition} --short-option=b --long-option=base --require-parameter \
            --description='Filter by mandatorily accepted Base Commands' --arguments='(_subabbr_complete_list base)'
        $common_complete {$list_complete_condition} --short-option=m --long-option=match --require-parameter \
            --description='Filter by sub-command match type' \
            --arguments='
            fixed\t\'Exactly matched sub-command\'
            regex\t\'Sub-command matched with RegExp\'
        '
        single-switch {$list_complete_condition} --short-option=i --long-option=invert --description='Invert the match'
        single-switch {$list_complete_condition} --short-option=r --long-option=regex --description='Match command-line positionals with RegExp'
    end

    begin
        set --local -- creation_condition --condition='test "$(__fish_print_cmd_args_without_options)[2]" = add'
        function _subabbr_complete_creation_initials
            argparse --move-unknown 'b/base=*&' -- (__fish_print_cmd_args)[3..]
            if test -z "$_flag_base"
                echo -- --base=
                return
            end
            set --local -- initials (__fish_print_cmd_args_without_options)[3..]
            if test (count {$_flag_base}) -eq 1
                complete --do-complete="$_flag_base $initials "
            else
                for base_command in {$_flag_base}
                    for single_completions in (complete --do-complete="$base_command $initials ")
                        set --local -- completion_components (string split -- \t {$single_completions})
                        echo -n -- {$completion_components[1]}\t{$base_command}
                        echo :\ {$completion_components[2]}
                    end
                end
            end
        end
        $common_complete {$creation_condition} --arguments='(_subabbr_complete_creation_initials)' --keep-order
        $common_complete {$creation_condition} --short-option=b --long-option=base --require-parameter --description='Accepted Base Commands' --arguments=\(__fish_complete_command\)
        begin
            set --local -- single_complete single-switch {$creation_condition}
            $single_complete --short-option=c --long-option=set-cursor --description='Position the cursor at % post-expansion'
            $single_complete --short-option=0 --long-option=unprefix --description='don\'t tolerate prefixes before Base Command'
            $single_complete --short-option=s --long-option=regard-flags --description='Acknowledge flags in the Initial Command'
            $single_complete --short-option=e --long-option=expander --description='Use the output of a command as the Expansion'
        end

        begin
            set --local regex_complete {$common_complete} {$creation_condition} --short-option=r --long-option=regex
            $regex_complete --description='Match command-line arguments with RegExp'
            begin
                set --local -- regex_value {$regex_complete} --condition='string match --quiet --regex -- \'^(--regex=|-r)\w*$\' (commandline -xtc)'
                $regex_value --arguments=sub-command --description='Match the sub-command with RegExp'
                $regex_value --arguments=initials --description='Match Initial Arguments with RegExp'
            end
        end
    end
end
