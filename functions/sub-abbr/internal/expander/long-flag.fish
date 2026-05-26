function _sub-abbr_internal_expander_long-flag --description='Expand flag: short → long'
    set --local -- longFlag {$argv[1]}
    test (count {$argv}) -eq 3 && set --local -- cursor {$argv[2]}
    set --local -- shortFlag_value {$argv[-1]}

    echo -n --{$longFlag}
    set --local -- value (string sub --start=3 -- {$shortFlag_value})

    if test -z "$value"
        set --query --local -- cursor && echo ={$cursor}
    else
        echo ={$value}
    end
end
