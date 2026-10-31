function _awabbre_internal_verify-arg_list-value-regexp-scope --description='Validate that only valid scopes are specified to List RegExp option'
    set --local -- valid_scopes bases initials sub-command expansion cursor
    for specified_scope in {$_flag_value}
        contains -- {$specified_scope} {$valid_scopes} ||
            set --append --function -- invalid_scopes {$specified_scope}
    end
    set --query --function -- invalid_scopes ||
        return 0
    set --local -- print echo (format text dim 'awabbre')(format text dim (format text color white ':'))
    $print 'Expected scopes to be one of:' (format background black --bright {$valid_scopes} | string join ' ')'; got' (format background red --bright {$invalid_scopes})
    return 1
end
