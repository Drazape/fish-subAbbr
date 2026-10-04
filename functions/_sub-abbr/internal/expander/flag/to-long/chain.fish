function _sub-abbr_internal_expander_flag_to-long_chain --description='Expand flag: short → long; Regex initials unsupported; chaining supported' --argument-names={context_prefix,short_flags}
    set --local -- short_chars (string split -- \0 {$short_flags})[2..] # suffixed short flags that are passed by `abbr` internally, for this function is the internal (backend) expander.
    set --local -- short_chars_left (count {$short_chars})
    for short_char in {$short_chars}
        set -- short_chars_left (math {$short_chars_left} - 1)
        set --local -- long_flag_name {$context_prefix}_(string escape --style=var -- {$short_char})
        if set --query --global -- {$long_flag_name}
            echo -n -- --{$$long_flag_name[1][1]}
            if test "$$long_flag_name[1][2]" = mandatory
                echo -n -- =
                if test {$short_chars_left} -eq 0
                    echo -- (status current-function)_cursor
                else
                    # remaining chars are the value to the mandatory flag
                    set --local -- remaining_chars_index -{$short_chars_left}
                    string join -- \0 {$short_chars[$remaining_chars_index..]}
                    break
                end
            else
                echo
            end
        else
            echo -- -{$short_char}
        end
    end
end
