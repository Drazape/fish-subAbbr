function _sub-abbr_internal_verify-arg_base-command --description='Verify the specified Base Command exists'
    if test "$subabbr_nonexistent_basecommand" != allow
        for base_command in {$_flag_values}
            if ! type --query -- {$base_command}
                test "$subabbr_nonexistent_basecommand" = quiet &&
                    return 1
                set --append --function -- invalid_base_commands {$base_command}
            end
        end
        if set --query --function -- invalid_base_commands
            $print Unknown (format text italics 'Base Command'): (format background red {$base_command}) >&2
            $print see (format url https://drazape.github.io/fish-subAbbr/Usage/Reference/Configuration/Check_Base-Command/ 'Check Base Command') 'for more information'
            return 2
        end
        return 0
    end
    return 0
end
