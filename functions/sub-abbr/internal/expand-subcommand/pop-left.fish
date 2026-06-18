function _sub-abbr_internal_expand-subcommand_pop-left --no-scope-shadowing --description='Remove real Base Command from sub arguments'
    set --function -- active_sub_args {$active_sub_args[2..]}
end
