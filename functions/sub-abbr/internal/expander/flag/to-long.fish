function _sub-abbr_internal_expander_flag_to-long --description='Expand flag: short → long'
    argparse 'm/mandatory&' -- {$argv}
    set --local -- longFlag {$argv[1]}
    test (count {$argv}) -eq 3 && set --local -- cursor {$argv[2]}
    set --local -- suffixed_shortFlag {$argv[-1]} # passed by `sub-abbr`

    echo -n --{$longFlag}
    set --local -- suffix (string sub --start=3 -- {$suffixed_shortFlag})

    if set --query --local -- _flag_mandatory
        if test -z "$suffix"
            echo ={$cursor}
        else
            echo ={$suffix} # value
        end
    else if test -n "$suffix"
        echo \ -{$suffix} # chained short flag(s)
    end
end
