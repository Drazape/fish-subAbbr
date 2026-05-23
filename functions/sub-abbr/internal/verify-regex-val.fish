function _sub-abbr_internal_verify-regex-val --description='Verify that the RegExp flag gets one of the appropriate values'
    set --local -- accepted_values sub-command initials
    contains {$_flag_value} {$accepted_values} || echo 'Expected value one of:' (set_color --background=brblack){$accepted_values}(set_color --reset)
end
