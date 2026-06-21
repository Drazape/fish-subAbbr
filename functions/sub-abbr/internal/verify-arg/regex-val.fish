function _sub-abbr_internal_verify-arg_regex-val --description='Verify that the RegExp flag gets one of the appropriate values'
    set --local -- accepted_values sub-command initials
    contains {$_flag_value} {$accepted_values} || echo 'Expected value one of:' (format background brblack --bright {$accepted_values})
end
