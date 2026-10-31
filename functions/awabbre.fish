function awabbre --description='Create abbreviations for sub-commands'
    # Nix dependencies: string placements to be overridden with store paths
    for dependency_configurations in /dev/null # shell-startup directories
        for dependency_config in {$dependency_configurations}/*
            source -- {$dependency_config}
        end
    end
    set --function -- additional_function_paths PATHS-TO-DEPENDENCY-FUNCTIONS
    set --prepend -- fish_function_path {$additional_function_paths}

    begin
        set --local -- output_name (format text dim (status function))
        set --function -- argparse{,} --name={$output_name}
        set --function -- error_output_prefix {$output_name}(format text dim (format text color white ':'))
        set --function -- print echo -- {$error_output_prefix}
    end

    $argparse --stop-nonopt 'h/help&' -- {$argv}

    # general sub-command reference
    set --local -- add_description 'Create a new abbreviation, or override an existing one'
    set --local -- list_description 'List the identifier of each abbreviation currently loaded'
    set --local -- show_description 'Show the details of an abbreviation by its identifier'
    set --local -- erase_description 'Erase an abbreviation by its identifier'
    if set --query --local -- _flag_help
        help-text --link=_awabbre_internal_helpText-linker 'Context-aware Sub-Command abbreviations' \
            --sub-command={
                'add | '{$add_description},
                'list | '{$list_description},
                'show | '{$show_description},
                'erase | '{$erase_description}
            } \
            --flag='help:h | Display the reference manual for the current sub-command'
        _awabbre_internal_revert-paths
        return
    end

    set --function -- identifier_prefix _awabbre_definition_
    set --function -- internal_description_prefix 'awabbre: '
    # common prefix length data for identity sub-commands
    if contains -- {$argv[1]} list show erase
        set --function -- prefix_length (string length -- {$identifier_prefix})
        set --function -- identifier_start (math {$prefix_length} + 1)
    end

    set --local -- subcommand_args {$argv[2..]} # Trimmed sub-commands
    # individual sub-commands
    switch "$argv[1]"
        case list
            if ! $argparse \
                    # exclusive switches
                    'm/value-regexp=?&!_awabbre_internal_verify-arg_list-value-regexp-scope' \
                    'i/invert&' \
                    'h/help&' \
                    'S/sub-command=&' \
                    'E/expansion=&' \
                    # Add switches
                    'b/base=+&' \
                    'r/regex=*&!_awabbre_internal_verify-arg_regex-val' \
                    'e/expander&' \
                    'c/set-cursor=?&' \
                    '0/unprefix&' \
                    's/regard-flags&' \
                    -- {$subcommand_args}
                _awabbre_internal_revert-paths
                return 1
            end
            if set --query --local -- _flag_help
                _awabbre_help_list= help-text --link=_awabbre_internal_helpText-linker {$list_description} \
                    --positional='+Initials | Filter by arguments that are matched before expanding the sub-command' \
                    --flag={
                                'invert:i | Invert the match result',
                                'cmdline-regexp:m | Match command-line argument values with RegExp',
                                'sub-command:S | Only abbreviations that match the specified Sub-Command',
                                'expansion:E | Only abbreviations that match the specified Expansion',
                                'base:b | Specify Base Commands the abbreviation must trigger on',
                                'unprefix:0 | Filter out abbreviations that tolerate '(format background black --bright '$awabbre_prefix')' before the Base Command',
                                'regard-flags:s | Only abbreviations must acknowledge flags in the Initial Args',
                                'set-cursor:c | Only abbreviations that manually position the cursor',
                                'regex:r | Only abbreviations that match command-line arguments with Regex',
                                'expander:e | Only abbreviations that use a function\'s output as the Expansion'
                            }
                _awabbre_internal_revert-paths
                return
            end
            set --query --local -- _flag_regex &&
                test (count {$_flag_regex}) -eq 0 &&
                set --local -- _flag_regex sub-command

            if set --query --local -- _flag_value_regexp
                test (count {$_flag_value_regexp}) -eq 0 &&
                    set -- _flag_value_regexp bases initials sub-command expansion cursor
                for scope in {$_flag_value_regexp}
                    # instead of recursing through the list of scopes each time
                    # simply use the already set Regex flag token for `string match`
                    set --function -- regex_flag_scope_(string replace -- - \0 {$scope}) --regex
                end
            end

            _awabbre_internal_identifier-data_gather-list
            set --local -- filtered_identifiers
            set --query --local -- _flag_pos_regexp &&
                set --local -- positionals_regex_flag --regex
            for identifier in {$identifiers}
                _awabbre_internal_identifier-data_individual-info {$identifier}
                set --query --local -- _flag_expander &&
                    ! set --query --local -- use_expander &&
                    continue
                set --query --local -- _flag_unprefix &&
                    ! set --query --local -- forget_prefixes &&
                    continue
                set --query --local -- _flag_regard_flags &&
                    ! set --query --local -- regard_flags &&
                    continue
                set --local -- regex_scope_unmatched 0
                for scope in {$_flag_regex}
                    if ! contains -- {$scope} {$regex_scopes}
                        set -- regex_scope_unmatched 1 # continue outside superloop
                        break
                    end
                end
                test "$regex_scope_unmatched" -eq 1 &&
                    continue
                set --query --local -- _flag_set_cursor &&
                    if ! set --query --local -- cursor_placeholder
                        continue
                    else if test (count {$_flag_set_cursor}) -eq 1 && ! string match --quiet {$regex_flag_scope_cursor} -- {$_flag_set_cursor} {$cursor_placeholder}
                        continue
                    end
                if set --query --local -- _flag_base
                    set --local -- bases_unmatched 0
                    for passed_base in {$_flag_base}
                        if ! string match --quiet {$regex_flag_scope_bases} -- {$passed_base} {$bases}
                            set -- bases_unmatched 1 # continue outside superloop
                            break
                        end
                    end
                    test "$bases_unmatched" -eq 1 &&
                        continue
                end
                set --query --local -- _flag_sub_command &&
                    ! string match --quiet {$regex_flag_scope_subcommand} -- {$_flag_sub_command} {$subcommand} &&
                    continue
                set --query --local -- _flag_expansion &&
                    ! string match --quiet {$regex_flag_scope_expansion} -- {$_flag_expansion} {$expansion} &&
                    continue
                if test (count {$argv}) -gt 0
                    set --local -- index_count 1
                    set --local -- init_unmatched 0
                    for passed_init_match in {$argv}
                        if ! string match --quiet {$regex_flag_scope_initials} -- "$passed_init_match" "$initials[$index_count]"
                            set -- init_unmatched 1 # continue outside superloop
                            break
                        end
                        set -- index_count (math {$index_count} + 1)
                    end
                    test "$init_unmatched" -eq 1 &&
                        continue
                end
                set --erase --local -- bases initials subcommand expansion regex_scopes cursor_placeholder use_expander forget_prefixes regard_flags
                set --append -- filtered_identifiers {$identifier}
            end
            if set --query --local -- _flag_invert
                for identifier in {$identifiers}
                    contains -- {$identifier} {$filtered_identifiers} ||
                        echo -- {$identifier}
                end
            else
                string repeat -- 1 {$filtered_identifiers}
            end
        case show
            $argparse 'e/escaped&' 'h/help&' -- {$subcommand_args}
            if set --query --local -- _flag_help
                help-text --link=_awabbre_internal_helpText-linker {$show_description} \
                    --positional='+Identifier | identifier of abbr to show details for'
                _awabbre_internal_revert-paths
                return
            end

            # main operation
            _awabbre_internal_identifier-data_gather-list
            if test (count {$argv}) -eq 0
                set --function -- identifiers_to_show {$identifiers}
            else
                if ! _awabbre_internal_verify-arg_identifier-existance {$argv}
                    _awabbre_internal_revert-paths
                    return 2
                end
                set --function -- identifiers_to_show {$argv}
            end
            for identifier in {$identifiers_to_show}
                # gather info
                ## info in non-identifier
                _awabbre_internal_identifier-data_individual-info {$identifier}

                # display: machine parsable: commandline evaluation → argparse
                set --local -- base_flag_value {$bases}
                test (count {$bases}) -ne 1 &&
                    set --local -- base_flag_value \{(
                                string join -- , {$bases})\}

                set --local -- cursor_equals
                set --local -- cursor_flag
                if set --query --local -- cursor_placeholder
                    set -- cursor_flag --set-cursor
                    test -n "$cursor_placeholder" &&
                        set -- cursor_equals '='
                end

                for command in echo emit
                    set --local -- definition_tokens --base={$base_flag_value} --regex={$regex_scopes} {$cursor_flag}"$cursor_equals""$cursor_placeholder" {$use_expander} {$forget_prefixes} {$regard_flags} -- {$initials} {$subcommand} {$expansion}
                    set --query --local -- _flag_escaped &&
                        set --local -- definition_tokens (string escape --style=script -- {$definition_tokens})
                    $command -- {$definition_tokens}
                end
                set --erase --local -- bases initials subcommand expansion regex_scopes cursor_placeholder use_expander forget_prefixes regard_flags
            end
        case erase
            $argparse 'h/help&' -- {$subcommand_args}
            if set --query --local -- _flag_help
                help-text --link=_awabbre_internal_helpText-linker {$erase_description} --positional='+Identifier | the context-aware abbreviation identifier to erase'
                _awabbre_internal_revert-paths
                return
            end

            _awabbre_internal_identifier-data_gather-list commands
            if ! _awabbre_internal_verify-arg_more-args 1 {$subcommand_args}
                _awabbre_internal_revert-paths
                return 3
            end
            if ! _awabbre_internal_verify-arg_identifier-existance {$subcommand_args}
                _awabbre_internal_revert-paths
                return 4
            end

            # main operation
            ## erase depending on type
            for identifier in {$subcommand_args}
                set --local -- internal_identifier
                _awabbre_internal_identifier-data_individual-info {$identifier}
                if contains -- sub-command {$regex_scopes} || contains -- \0 {$regex_scopes}
                    set -- internal_identifier {$identifier_prefix}(
                                string sub --end=2 -- {$identifier}
                            )(string escape --style=var -- (
                                string sub --start=3 -- {$identifier}
                            ))
                else
                    set -- internal_identifier (
                                string split --right --max=1 --fields=2 -- ' ' {$identifier})
                end
                functions --erase -- {$internal_identifier} # internal specialized expander
                set --local -- commands_varname (string escape --style=var -- {$identifier})_commands
                abbr --erase --command={$$commands_varname} -- {$internal_identifier}
                set --erase --local -- regex_scopes
            end

            ## Hook to erase unknown runtime data used by wrappers.
            emit -- awabbre_erase {$subcommand_args}
        case add
            # arguments
            ## Switches
            if ! $argparse \
                    b/base=+!_awabbre_internal_verify-arg_base-command \
                    r/regex=\*!_awabbre_internal_verify-arg_regex-val \
                    e/expander \
                    c/set-cursor=? \
                    h/help\& \
                    0/unprefix \
                    s/regard-flags \
                    -- {$subcommand_args}
                _awabbre_internal_revert-paths
                return 5
            end
            ### Help
            if set --query --local -- _flag_help
                help-text --link=_awabbre_internal_helpText-linker 'Create context-aware abbreviations' \
                    --positional={
                        '+Initial Args | All arguments that come before the Sub-Command',
                        'Sub-Command | Comes after the Initial Args; replaced by the Expansion',
                        'Expansion | Replaces the Sub-Command'
                    } \
                    --flag={
                        'base:b | Specify the Base Commands that can precedes the Initial Args',
                        'unprefix:0 | Deactivate toleration of '(format background black --bright '$awabbre_prefix')' before the Base Command',
                        'regard-flags:s | Acknowledge flags in the Initial Args',
                        'set-cursor:c | Position the cursor at '(format background black --bright '%')' post-expansion',
                        'regex:r | Match command-line arguments with Regex',
                        'expander:e | Use the output of a command as the Expansion'
                    }
                _awabbre_internal_revert-paths
                return
            end
            if ! set --query --local -- _flag_base
                echo -n -- {$error_output_prefix} 'Missing required option:' (format background black --bright 'base') >&2
                echo -- \n{$error_output_prefix}\ (
                    format background red --bright (
                        string match --regex -- '^\-\-base.*' {$argv})
                    )' might be meant to be specified earlier than '(
                        format background black --bright '--'
                    )'.' >&2
                $print Run (format background black --bright (status current-function)' add --help') 'to reference the' (format text italics 'Base') 'option.' >&2
                return 6
            end
            ### Set Cursor
            set --query --local _flag_set_cursor && if test -z {$_flag_set_cursor}
                set -- set_cursor --set-cursor
            else
                set -- set_cursor --set-cursor={$_flag_set_cursor}
            end
            ### RegExp
            if set --query --local -- _flag_regex
                test (count {$_flag_regex}) -eq 0 &&
                    set -- _flag_regex sub-command
                contains -- sub-command {$_flag_regex} &&
                    set --function -- regex_subcommand
                contains -- initials {$_flag_regex} &&
                    set --function -- regex_initials --regex
            end
            ## Positional
            begin
                # appropriate number of arguments. Not using `argparse` so that `--help can have as many arguments as it wants` and better formatted output
                if ! _awabbre_internal_verify-arg_more-args 2 {$argv}
                    _awabbre_internal_revert-paths
                    return 7
                end
                # Name arguments
                set --function -- initial_args {$argv[1..-3]}
                set --function -- subcommand {$argv[-2]}
                set --function -- expansion {$argv[-1]}
                # compatible subcommand name: must be a single token
                begin
                    if _awabbre_internal_verify-arg_subcommand-contains ' ' || _awabbre_internal_verify-arg_subcommand-contains \n
                        $print incompatible (format text italics 'Sub-Command'): (format background red --bright {$subcommand}) >&2
                        $print The (format text italics 'Sub-Command') 'must be a single token.' >&2
                        $print 'That is, it cannot contain spaces or newline characters—those are used for separating tokens.' >&2
                        _awabbre_internal_revert-paths
                        return 8
                    end
                end
            end

            # main operation
            begin
                set --local -- regex_str =
                set --query --function -- regex_initials &&
                    set --local -- regex_str r

                set --local -- escaped_bases (string escape --style=script --no-quoted -- {$_flag_base})
                set --local -- escaped_arguments (string escape --style=script --no-quoted -- {$initial_args} {$subcommand})

                # name compatible hash; specific to the combination
                set --function -- identifier {$identifier_prefix}{$regex_str}:(
                    string escape --style=var -- " $escaped_bases  $escaped_arguments" # separate escaped lists with consequent unescaped spaces. It cannot be part of a token since the second space would always have `\` prefixed to it.
                )
            end
            begin
                _awabbre_internal_default-prefix
                set --query --local _flag_unprefix ||
                    set --local -- tolerate_prefixes --command={$awabbre_prefix}

                set --local -- cursor_equals
                set --local -- cursor_flag
                if set --query --local -- _flag_set_cursor
                    set -- cursor_flag --set-cursor
                    test -n "$_flag_set_cursor" &&
                        set -- cursor_equals '='
                end

                set --local -- escaped_nonidentifier_arguments (
                    string escape --style=script -- \
                        --regex={$_flag_regex} {$_flag_expander} "$cursor_flag""$cursor_equals"{$_flag_set_cursor} {$_flag_unprefix} {$_flag_regard_flags} -- {$expansion})
                set --local -- common_flags \
                    --add \
                    --description={$internal_description_prefix}"$escaped_nonidentifier_arguments" \
                    --command={$_flag_base} \
                    {$tolerate_prefixes} \
                    --function={$identifier} \
                    {$set_cursor}
                if set --query --local -- regex_subcommand
                    abbr {$common_flags} --regex="$subcommand" -- {$identifier}
                else
                    abbr {$common_flags} -- "$subcommand"
                end
            end
            function {$identifier} --argument-names=subcommand --inherit-variable={_flag_base,expansion,initial_args,regex_initials,_flag_{unprefix,regard_flags,expander}}
                _awabbre_internal_expand-subcommand --base={$_flag_base} {$regex_initials} {$_flag_expander} {$_flag_unprefix} {$_flag_regard_flags} -- {$subcommand} {$expansion} {$initial_args}
            end

            emit -- awabbre_add --identifier={$identifier} {$argv_opts} -- {$argv}
        case \*
            if set --query --local -- argv[1]
                $print 'invalid sub-command:' (format text bold (format background red --bright {$argv[1]})) >&2
            else
                $print 'no sub-command specified.' >&2
            end
            $print Run (format background black --bright (status current-function)' --help') 'to reference the available sub-commands.' >&2
            _awabbre_internal_revert-paths
            return 9
    end
    _awabbre_internal_revert-paths
end
