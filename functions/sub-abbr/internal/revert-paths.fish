function _sub-abbr_internal_revert-paths --inherit-variable=additional_function_paths --description='Revert the dependency paths back to the original form'
    set --erase -- fish_function_path[1..(count {$additional_function_paths})]
end
