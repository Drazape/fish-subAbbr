function _sub-abbr_expand-subcommand --description='Expand a subcommand'
    # Input
    argparse f/function\& 0/degrade\& s/regard-flags\& -- {$argv}
    set --local subcommand {$argv[1]}
    set --function expansion {$argv[2]}
    set --function initial_args {$argv[3..]}
    set --query --local _flag_function &&
        set --local function_arguments (commandline --tokens-expanded --input={$expansion}) && # As of now, command substitutions can't be used as the Base Command in Fish
        set --function expansion ($function_arguments {$subcommand})

    # Commandline
    set --local argv (commandline --tokens-expanded --current-process)[..-2]
    set --local --query _flag_regard_flags || argparse --move-unknown -- {$argv}
    set --function arg_count (count {$initial_args})
    set --function active_sub_args {$argv[2..]}
    ! set --local --query _flag_degrade && test {$argv[1]} = run0 && set --function active_sub_args {$active_sub_args[2..]} # Remove real Base Command from sub arguments

    # Compare
    test {$arg_count} -eq (count {$active_sub_args}) || return 1
    for i in (seq 1 {$arg_count})
        test {$initial_args[$i]} = {$active_sub_args[$i]} || return 2
    end

    echo {$expansion}
end
