function _sub-abbr_internal_expand-subcommand --description='Expand a subcommand'
    # Input
    argparse b/base=+\& r/regex\& e/expander\& 0/unprefix\& s/regard-flags\& -- {$argv}
    set --local -- subcommand {$argv[1]}
    set --function -- expansion {$argv[2]}
    set --function -- initial_args {$argv[3..]}
    set --query --local -- _flag_expander &&
        set --local -- expander_arguments (commandline --tokens-expanded --input={$expansion}) && # command substitutions can't be used as the *Base Command* in Fish
        set --function -- expansion ($expander_arguments {$subcommand})

    # Commandline
    set --local -- argv (commandline --tokens-expanded --current-process)[..-2]
    set --query --local -- _flag_regard_flags ||
        argparse --move-unknown -- {$argv}
    begin
        test {$argv[1]} = exec &&
            set --erase -- argv[1]
        if ! set --query --local -- _flag_unprefix
            for prefix in {$subabbr_prefix}
                contains -- {$argv[1]} {$subabbr_prefix} &&
                    set --erase -- argv[1]
            end
            contains -- {$argv[1]} {$_flag_base} ||
                return 1
        end
    end

    # Compare
    set --function -- active_sub_args {$argv[2..]}
    begin
        test (count {$initial_args}) -eq (count {$active_sub_args}) || return 2
        set --local -- index_count 1
        for initial_arg in {$initial_args}
            if set --query --local -- _flag_regex
                string match --regex --quiet -- {$initial_arg} {$active_sub_args[$index_count]} ||
                    return 2
            else
                test {$initial_arg} = {$active_sub_args[$index_count]} ||
                    return 3
            end
            set -- index_count (math {$index_count} + 1)
        end
    end

    echo -- {$expansion}
end
