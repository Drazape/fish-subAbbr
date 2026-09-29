function _sub-abbr_internal_expand-subcommand --description='Expand a subcommand'
    # Input
    argparse r/regex\& e/expander\& 0/degrade\& s/regard-flags\& -- {$argv}
    set --local -- subcommand {$argv[1]}
    set --function -- expansion {$argv[2]}
    set --function -- base_command {$argv[3]}
    set --function -- initial_args {$argv[4..]}
    set --query --local -- _flag_expander &&
        set --local -- expander_arguments (commandline --tokens-expanded --input={$expansion}) && # command substitutions can't be used as the *Base Command* in Fish
        set --function -- expansion ($expander_arguments {$subcommand})

    # Commandline
    set --local -- argv (commandline --tokens-expanded --current-process)[..-2]
    set --query --local -- _flag_regard_flags || argparse --move-unknown -- {$argv}
    set --function -- active_sub_args {$argv[2..]}
    begin
        set --local -- popleft (status current-function)_pop-left
        if test {$argv[1]} = exec
            $popleft
            set argv {$argv[2]} # change base-command in case used alongside `run0`, for test
        end
        if ! set --query --local -- _flag_degrade && test {$argv[1]} = run0
            test {$base_command} != {$active_sub_args[1]} && return 1
            $popleft
        end
    end

    # Compare
    begin
        test (count {$initial_args}) -eq (count {$active_sub_args}) || return 2
        set --local -- index_count 1
        for initial_arg in {$initial_args}
            if set --query --local -- _flag_regex
                string match --regex --quiet -- {$initial_arg} {$active_sub_args[$index_count]} || return 2
            else
                test {$initial_arg} = {$active_sub_args[$index_count]} || return 3
            end
            set -- index_count (math {$index_count} + 1)
        end
    end

    echo {$expansion}
end
