begin
    set --local -- common_complete complete --command=awabbre --no-files
    function single-switch --description='Only suggest the switch once' --inherit-variable=common_complete
        argparse --move-unknown s/short-option= l/long-option= -- {$argv}
        $common_complete --condition='! __fish_seen_argument --short='{$_flag_short_option}' --long='{$_flag_long_option} {$argv_opts} -- {$argv}
    end

    $common_complete
    single-switch --short-option=h --long-option=help --description='Reference manuals' \
        --condition='set --local -- unbase (__fish_print_cmd_args_without_options)[2..3]
                 if test (count {$unbase}) -eq 0 || test "$unbase[1]" = add
                     return 0
                 end
                 return 1'

    begin
        set --local -- subcommand_complete {$common_complete} --condition='test (__fish_number_of_cmd_args_wo_opts) -lt 2'
        $subcommand_complete --arguments=add --description='Create abbrs'
        $subcommand_complete --arguments=list --description='Get identifiers'
        $subcommand_complete --arguments=erase --description='Erase abbrs with their identity'
        $subcommand_complete --arguments=show --description='Show all details of an abbr'
    end

    $common_complete \
        --condition='contains -- "$(__fish_print_cmd_args_without_options)[2]" erase show' \
        --arguments='(awabbre list)'

    begin
        set --local -- list_complete_condition \
            'test "$(__fish_print_cmd_args_without_options)[2]" = list'

        function _awabbre_complete_list --argument-names=requested_component
            argparse --ignore-unknown \
                # parse such that invalid or missing values are tolerated
                # that is, singular values use a `?`, and multiple values use `*` instead of `+`.
                'm/value-regexp=*&' i/invert\& S/sub-command=?\& E/expansion=?\& \
                'b/base=*&' r/regex=\* e/expander c/set-cursor=? 0/unprefix s/regard-flags \
                -- (__fish_print_cmd_args)[3..]
            set --local -- commandline_initials {$argv}
            switch {$requested_component} # erase partial values so they don't affect the output
                case bases
                    set --erase --local -- _flag_base
                case subcommand
                    set --erase --local -- _flag_sub_command
                case expansion
                    set --erase --local -- _flag_expansion
                case initials
                    set --erase --local -- commandline_initials[-1]
                case cursor_placeholder
                    set --erase --local -- _flag_set_cursor
            end
            # variables inherited by `identifier-data` functions
            set --local -- argparse{,} --name='awabbre-list-completions'
            set --local -- internal_description_prefix 'awabbre: '
            set --local -- identifier_prefix _awabbre-definition_
            set --local -- prefix_length (string length -- {$identifier_prefix})
            set --local -- identifier_start (math {$prefix_length} + 1)
            _awabbre_internal_identifier-data_gather-list
            for matched_identifier in (awabbre list --base={$_flag_base} --sub-command={$_flag_sub_command} --expansion={$_flag_expansion} {$argv_opts} -- {$commandline_initials})
                _awabbre_internal_identifier-data_individual-info {$matched_identifier}
                set --local -- suggested_values {$$requested_component}
                if test {$requested_component} = initials
                    test (count {$initials}) -le (count {$commandline_initials}) &&
                        continue
                    echo -- {$initials[(math (count {$commandline_initials}) + 1)]}
                else
                    set --local -- description_provider _awabbre_complete_list_description_{$requested_component}
                    if functions --query -- {$description_provider}
                        for value_suggested in {$suggested_values}
                            echo -- {$value_suggested}\t($description_provider {$value_suggested})
                        end
                    else
                        string repeat -- 1 {$suggested_values}\t
                    end
                end
                set --erase --local -- bases initials subcommand expansion regex_scopes cursor_placeholder use_expander forget_prefixes regard_flags
            end
        end
        function _awabbre_complete_list_description_bases --argument-names=command_name
            type --type -- {$command_name}
        end
        begin
            set --local -- list_complete {$common_complete} --condition={$list_complete_condition}
            $list_complete --arguments='(_awabbre_complete_list initials)'

            begin # not using `single-switch` since a value is mandatory
                set --local -- list_mandatory_complete {$list_complete} --require-parameter
                $list_mandatory_complete --short-option=b --long-option=base --require-parameter \
                    --description='Filter by mandatorily accepted Base Commands' --arguments='(_awabbre_complete_list bases)'
                $list_mandatory_complete --short-option=S --long-option=sub-command --require-parameter \
                    --description='Filter by sub-command to expand' --argument='(_awabbre_complete_list subcommand)'
                $list_mandatory_complete --short-option=E --long-option=expansion --require-parameter \
                    --description='Filter by what the sub-command expands to' --argument='(_awabbre_complete_list expansion)'
                $list_mandatory_complete --short-option=c --long-option=set-cursor \
                    --description='Filter by what cursor placeholder is used' --arguments='(_awabbre_complete_list cursor_placeholder)'
                $list_mandatory_complete --short-option=m --long-option=value-regexp \
                    --description='Match any argument value with Regular Expressions' \
                    --arguments='
                        bases\t\'Base-Commands executed\'
                        initials\t\'Initial Arguments preceding Sub-Command\'
                        sub-command\t\'Token to be expanded\'
                        expansion\t\'Value to expand into\'
                        cursor\t\'Cursor placeholder string\'
                    '
            end
        end
        single-switch --condition={$list_complete_condition} --short-option=i --long-option=invert --description='Invert the match'
        single-switch --condition={$list_complete_condition} --short-option=r --long-option=regex --description='Match command-line positionals with RegExp'
        # Other switches common with Add are merged with the latter sub-command

        begin
            set --local -- creation_condition 'test "$(__fish_print_cmd_args_without_options)[2]" = add'
            function _awabbre_complete_creation_initials
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
                            echo -- :\ {$completion_components[2]}
                        end
                    end
                end
            end
            $common_complete --condition={$creation_condition} --arguments='(_awabbre_complete_creation_initials)' --keep-order
            $common_complete --condition={$creation_condition} --short-option=b --long-option=base --require-parameter --description='Accepted Base Commands' --arguments=\(__fish_complete_command\)

            set --local -- creation_or_list_condition_flag --condition={$creation_condition}' || '{$list_complete_condition}
            begin
                set --local -- single_complete single-switch {$creation_or_list_condition_flag}
                $single_complete --short-option=c --long-option=set-cursor --description='Position the cursor at % post-expansion'
                $single_complete --short-option=0 --long-option=unprefix --description='don\'t tolerate prefixes before Base Command'
                $single_complete --short-option=s --long-option=regard-flags --description='Acknowledge flags in the Initial Command'
                $single_complete --short-option=e --long-option=expander --description='Use the output of a command as the Expansion'
            end

            begin
                set --local regex_complete {$common_complete} {$creation_or_list_condition_flag} --short-option=r --long-option=regex
                $regex_complete --description='Match command-line arguments with RegExp'
                begin
                    set --local -- regex_value {$regex_complete} --condition='string match --quiet --regex -- \'^(--regex=|-r)\w*$\' (commandline -xtc)'
                    $regex_value --arguments=sub-command --description='Match the sub-command with RegExp'
                    $regex_value --arguments=initials --description='Match Initial Arguments with RegExp'
                end
            end
        end
    end
end
