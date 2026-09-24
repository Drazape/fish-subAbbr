function sub-abbr --description='Create abbreviations for sub-commands'
    # Nix dependencies: string placements to be overriden with store paths
    for dependency_configurations in /dev/null # shell-startup directories
        for dependency_config in {$dependency_configurations}/*
            source -- {$dependency_config}
        end
    end
    set --function -- additional_function_paths PATHS-TO-DEPENDENCY-FUNCTIONS
    set --prepend -- fish_function_path {$additional_function_paths}

    begin
        set --local -- output_name (format text dim (status function))
        set --function -- argparse argparse --name={$output_name}
        set --function -- print echo {$output_name}(format text dim (format text color white ':'))
    end

    $argparse --stop-nonopt 'h/help&' -- {$argv}

    # general sub-command reference
    set --local -- add_description 'Create context-aware sub-command abbreviations'
    if set --query --local -- _flag_help
        help-text --link=_sub-abbr_internal_helpText-linker 'Context-aware Sub-Command abbreviations' \
            --sub-command={
                'add | '{$add_description},
                'identity | Manage abbreviations by their identifiers'
            } \
            --flag='help:h | Show a reference manual for a sub-command'
        _sub-abbr_internal_revert-paths
        return
    end

    # individual sub-commands
    switch "$argv[1]"
        case identity
            set --local -- identity_args {$argv[2..]} # arguments excluding the root sub-command
            set --local -- erase_description 'Erase an abbreviation by it\'s identifier'
            $argparse --stop-nonopt 'h/help&' -- {$identity_args}
            if set --query --local _flag_help
                help-text --link=_sub-abbr_internal_helpText-linker 'Manage context-aware Sub-Command abbreviations by their identifiers' \
                    --sub-command={
                        'list | List the identifiers of each loaded abbreviation',
                        'erase | '{$erase_description}
                    }
                _sub-abbr_internal_revert-paths
                return
            end

            set --function -- identifier_prefix '_sub-abbr_expand '
            set --local -- prefix_length (string length {$identifier_prefix})
            set --local -- identifier_start (math {$prefix_length} + 1)
            # common data
            for abbr in (abbr)
                argparse --ignore-unknown '/function=&' -- (commandline --tokens-expanded --input={$abbr})
                string match --quiet --entire --regex -- ^{$identifier_prefix} (string unescape --style=var -- {$_flag_function}) || continue

                argparse --ignore-unknown '/command=+&' '/function=&' -- (commandline --tokens-expanded --input={$abbr})
                set --local -- unescaped_function (string unescape --style=var -- {$_flag_function})
                set --local -- identifier (string sub --start={$identifier_start} -- {$unescaped_function})
                string match --quiet -- {$identifier_prefix} (string sub --end={$prefix_length} {$unescaped_function}) && set --append --function -- identifiers {$identifier}
                set --append --function -- (string escape --style=var -- $identifier)_commands {$_flag_command}
            end

            # sub-commands
            set --local -- identity_subcommand_args {$identity_args[2..]} # Trimmed sub-commands: `identity` `list`/`erase`; Arguments used sub-commands `identity`
            switch "$identity_args[1]"
                case list
                    if ! $argparse 'r/regex&' 'i/invert&' 'm/match=&!_sub-abbr_internal_verify-arg_match-type' 'h/help&' -- {$identity_subcommand_args}
                        _sub-abbr_internal_revert-paths
                        return 1
                    end
                    if set --query --local _flag_help
                        _subabbr_help_list= help-text --link=_sub-abbr_internal_helpText-linker 'List the identifiers of each loaded abbreviation' \
                            --flag={
                                'match:m | Only list identifiers with the specified Sub-Command string match type',
                                'invert:i | Invert the match result',
                                'regex:r | Match command-line positionals with RegExp'
                            }
                        _sub-abbr_internal_revert-paths
                        return
                    end
                    set --local -- filtered_identifiers
                    for identifier in {$identifiers}
                        set --local -- identifier_tokens (commandline --tokens-expanded --input={$identifier}) # `commandline` parsing instead of space separation also handles any space escapes
                        if set --query --local -- _flag_match
                            switch (string split --fields=1 --max=1 -- : {$identifier_tokens[1]})
                                case =
                                    test {$_flag_match} != fixed &&
                                        continue
                                case r
                                    test {$_flag_match} != regex &&
                                        continue
                            end
                        end
                        if test (count {$argv}) -gt 0
                            set --local -- index_count 2 # start at 2 to skip the first token—the match type
                            for passed_arg_match in {$argv}
                                string match --quiet {$_flag_regex} -- "$passed_arg_match" "$identifier_tokens[$index_count]" ||
                                    set --function -- arg_unmatched # continue outside the current loop
                                set -- index_count (math {$index_count} + 1)
                            end
                            if set --query --function -- arg_unmatched
                                set --erase --function -- arg_unmatched
                                continue
                            end
                        end
                        set --append -- filtered_identifiers {$identifier}
                    end
                    if set --query --local -- _flag_invert
                        for identifier in {$identifiers}
                            contains -- {$identifier} {$filtered_identifiers} ||
                                echo {$identifier}
                        end
                    else
                        string repeat -- 1 {$filtered_identifiers}
                    end
                case erase
                    $argparse 'h/help&' -- {$identity_subcommand_args}
                    if set --query --local _flag_help
                        help-text --link=_sub-abbr_internal_helpText-linker {$erase_description} --positional='+Identifier | context-aware sub-command abbreviation identifier'
                        _sub-abbr_internal_revert-paths
                        return
                    end

                    if ! _sub-abbr_internal_verify-arg_more-args 1 {$identity_subcommand_args}
                        _sub-abbr_internal_revert-paths
                        return 2
                    end
                    # main operation
                    ## verify existance
                    for identifier in {$identity_subcommand_args}
                        if ! contains {$identifier} {$identifiers}
                            $print 'unknown context-aware sub-command abbreviation:' (format text bold (format text italics (format text color red {$identifier}))) >&2
                            _sub-abbr_internal_revert-paths
                            return 3
                        end
                    end
                    ## erase depending on type
                    for identifier in {$identity_subcommand_args}
                        set --local -- internal_identifier
                        if test (string sub --end=1 -- {$identifier}) = =
                            set -- internal_identifier (string split --right --max=1 --fields=2 -- ' ' {$identifier})
                        else
                            set -- internal_identifier (string escape --style=var -- {$identifier_prefix}{$identifier})
                        end
                        functions --erase -- {$internal_identifier} # internal specialized expander
                        set --local -- commands (string escape --style=var -- {$identifier})_commands
                        abbr --erase --command={$$commands} -- {$internal_identifier}
                    end
                case \*
                    $print unknown (format text italics 'Identity') sub-command: (format text bold (format background red --bright {$identity_args[1]})) >&2
                    _sub-abbr_internal_revert-paths
                    return 4
            end
        case add
            # arguments
            ## Switches
            if ! $argparse 'r/regex=*&!_sub-abbr_internal_verify-arg_regex-val' 'e/expander&' 'c/set-cursor=?&' 'h/help&' '0/degrade&' 's/regard-flags&' -- {$argv}
                _sub-abbr_internal_revert-paths
                return 5
            end
            ### Help
            if set --query --local _flag_help
                help-text --link=_sub-abbr_internal_helpText-linker 'Create context-aware Sub-Command abbreviations' \
                    --positional={
                        '+Initial Args | All arguments that come before the Sub-Command',
                        'Sub-Command | Comes after the Initial Args; replaced by the Expansion',
                        'Expansion | Replaces the Sub-Command'
                    } \
                    --flag={
                        'degrade:0 | Deactivate '(format background red 'run0')' prefix toleration',
                        'regard-flags:s | Acknowledge flags in the Initial Args',
                        'set-cursor:c | Position the cursor at '(format background black --bright '%')' post-expansion',
                        'regex:r | Match command-line arguments with Regex',
                        'expander:e | Use the output of a command as the Expansion'
                    }
                _sub-abbr_internal_revert-paths
                return
            end
            ### Set Cursor
            set --query --local _flag_set_cursor && if test -z {$_flag_set_cursor}
                set -- set_cursor --set-cursor
            else
                set -- set_cursor --set-cursor={$_flag_set_cursor}
            end
            ### RegExp
            for value in \0 sub-command
                contains -- {$value} {$_flag_regex} && set --function -- regex_subcommand
            end
            contains -- initials {$_flag_regex} && set --function -- regex_initials --regex
            ## Positional
            begin
                set --local -- add_args {$argv[2..]} # Trimmed sub-command `add`; Arguments used by this specific sub-command
                # appropriate number of arguments. Not using `argparse` so that `--help can have as many arguments as it wants` and better formatted output
                if ! _sub-abbr_internal_verify-arg_more-args 3 {$add_args}
                    _sub-abbr_internal_revert-paths
                    return 6
                end
                # Name arguments
                set --function base_command {$add_args[1]}
                if test "$subabbr_nonexistent_basecommand" != allow && ! type --query -- {$base_command}
                    if test "$subabbr_nonexistent_basecommand" != quiet
                        $print Unknown (format text italics 'Base Command'): (format background red {$base_command}) >&2
                        $print see (format url https://drazape.github.io/fish-subAbbr/Usage/Reference/Configuration/Check_Base-Command/ 'Check Base Command') 'for more information'
                    end
                    _sub-abbr_internal_revert-paths
                    return 7
                end
                set --function initial_args {$add_args[2..-3]}
                set --function subcommand {$add_args[-2]}
                set --function expansion {$add_args[-1]}
                # compatible subcommand name: must be a single token
                begin
                    if _sub-abbr_internal_verify-arg_subcommand-contains ' ' || _sub-abbr_internal_verify-arg_subcommand-contains \n
                        $print incompatible (format text italics 'Sub-Command') >&2
                        _sub-abbr_internal_revert-paths
                        return 8
                    end
                end
            end

            # main operation
            begin
                set --local -- regexStr =
                set --query --local -- regex_subcommand && set --local -- regexStr r
                set --local -- all_escaped_arguments (string escape --style=script -- $base_command $initial_args $subcommand)
                # name compatible hash; specific to the combination
                set --function -- identifier (
                    string escape --style=var -- _sub-abbr_expand\ {$regexStr}:\ "$all_escaped_arguments"
                )
            end
            begin
                set --query --local _flag_degrade || set --local -- tolerate_run0 --command=run0
                set --local -- common_flags --add --command={$base_command} {$tolerate_run0} --function={$identifier} {$set_cursor}
                if set --query --local -- regex_subcommand
                    abbr {$common_flags} --regex="$subcommand" -- {$identifier}
                else
                    abbr {$common_flags} -- "$subcommand"
                end
            end
            function {$identifier} --argument-names=subcommand --inherit-variable={base_command,expansion,initial_args,regex_initials,_flag_{degrade,regard_flags,expander}}
                _sub-abbr_internal_expand-subcommand {$regex_initials} {$_flag_expander} {$_flag_degrade} {$_flag_regard_flags} -- {$subcommand} {$expansion} {$base_command} {$initial_args}
            end
        case \*
            $print 'unknown sub-command:' (format text bold (format background red --bright {$argv[1]})) >&2
            _sub-abbr_internal_revert-paths
            return 9
    end
    _sub-abbr_internal_revert-paths
end
