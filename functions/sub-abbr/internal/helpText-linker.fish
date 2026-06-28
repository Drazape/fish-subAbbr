function _sub-abbr_internal_helpText-linker --description='Linker for fish-subAbbr itself' --argument-names={type,name}
    set --local -- baseURL https://drazape.github.io/fish-subAbbr
    if test (count {$argv}) -eq 0
        echo -- {$baseURL}/
        return
    end
    set --local -- baseURL {$baseURL}/Usage/Arguments

    switch {$type}
        case heading
            switch {$name}
                case Positionals
                    echo -- {$baseURL}/Positionals/Expansion/
                case Sub-Commands
                    echo -- {$baseURL}/Sub-Commands/Add/
                case Flags
                    echo -- {$baseURL}/Universal-Switches/Help/
            end
        case positional
            switch {$name}
                case 'Initial Args'
                    echo -- {$baseURL}/Positionals/Initial-Arguments/
                case Sub-Command Expansion
                    echo -- {$baseURL}/Positionals/{$name}/
                case \*
                    return 1
            end
        case sub-command
            switch $name
                case add
                    echo -- {$baseURL}/Sub-Commands/Add/
                case identity
                    echo -- {$baseURL}/Sub-Commands/Identity/
                case list
                    echo -- {$baseURL}/Sub-Commands/Identity/Sub-Commands/List/
                case erase
                    echo -- {$baseURL}/Sub-Commands/Identity/Sub-Commands/Erase/
            end
        case flag
            switch $name
                case help
                    echo -- {$baseURL}/Universal-Switches/Help/
                case degrade
                    echo -- {$baseURL}/Sub-Commands/Add/Switches/Degrade/
                case expander
                    echo -- {$baseURL}/Sub-Commands/Add/Switches/Expander/
                case regard-flags
                    echo -- {$baseURL}/Sub-Commands/Add/Switches/Regard-Flags/
                case regex regular-expression
                    echo -- {$baseURL}/Sub-Commands/Add/Switches/Regular-Expression/
                case set-cursor
                    echo -- {$baseURL}/Sub-Commands/Add/Switches/Set-Cursor/
            end
    end
end
