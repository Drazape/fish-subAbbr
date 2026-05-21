function sub-abbr --description='Create abbreviations for subcommands'
    set --local output_name (set_color --dim)(status function)(set_color --reset)

    # arguments
    ## Switches
    argparse --name={$output_name} 'r/regex&' 'f/function&' 'c/set-cursor=?&' 'h/help&' '0/degrade&' 's/regard-flags&' -- {$argv} || return 1
    ### Set Cursor
    set --query --local _flag_set_cursor && if test -z {$_flag_set_cursor}
        set -- set_cursor --set-cursor
    else
        set -- set_cursor --set-cursor={$_flag_set_cursor}
    end
    ### Help (the only native switch)
    if set --query --local _flag_help
        set --local inherited \ (set_color white)'(inherited from '(set_color normal)(set_color --background=red)abbr(set_color normal)(set_color white)\)(set_color --reset)
        help-text 'Abbreviate subcommands' \
            --positional={
                  '+Initial Args | All arguments that come before the Sub-Command', 
                  'Sub-Command | Comes after the Initial Args; replaced by the Expansion',
                  'Expansion | Replaces the Sub-Command'
            } \
            --flag={
                'help:h | Show this reference manual',
                'degrade:0 | Disable '(set_color --background=red)run0(set_color --reset)' prefix toleration',
                'regard-flags:s | Acknowledge flags in the Initial Args',
                'set-cursor:c | Position the cursor at '(set_color --background=brblack)%(set_color --reset)' post-expansion'{$inherited},
                'regex:r | Match Sub-Command with Regex. Essential for multiple Initial Args permutations'{$inherited},
                'function:f | Use the output of a command as the Expansion'
            }
        return
    end
    ## Positional
    begin
        set --local output_prefix {$output_name}(set_color --dim white):(set_color --reset)
        ### appropriate number of arguments. Not using `argparse` so that `--help can have as many arguments as it wants` and better formatted output
        if test (count {$argv}) -lt 3
            echo {$output_prefix} expected (set_color --bold)2+(set_color --reset) arguments(set_color white)\;(set_color --reset) got (set_color --italics)(count {$argv})(set_color --reset)
            return 3
        end
        ### Name arguments
        set --function base_command {$argv[1]}
        set --function initial_args {$argv[2..-3]}
        set --function subcommand {$argv[-2]}
        set --function expansion {$argv[-1]}
        ### compatible subcommand name: must be a single token
        begin
            if _subcommand-contains ' ' || _subcommand-contains \n
                echo {$output_name} incompatible (set_color --italics)Sub-Command(set_color --reset)
                return 3
            end
        end
    end

    # main operation
    set --function identity (systemd-escape _sub-abbr_expand_"$base_command $initial_args $subcommand") # name compatible hash; specific to the combination
    begin
        set --query --local _flag_degrade || set --local -- tolerate_run0 --command=run0
        set --local -- common_flags --add --command={$base_command} {$tolerate_run0} --function={$identity} {$set_cursor}
        if set --query --local _flag_regex
            abbr {$common_flags} --regex="$subcommand" -- {$identity}
        else
            abbr {$common_flags} -- "$subcommand"
        end
    end
    function {$identity} --argument-names=subcommand --inherit-variable={expansion,initial_args,_flag_{degrade,regard_flags,function}}
        _expand-subcommand {$_flag_function} {$_flag_degrade} {$_flag_regard_flags} -- {$subcommand} {$expansion} {$initial_args}
    end
end
