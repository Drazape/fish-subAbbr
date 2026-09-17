function _sub-abbr_internal_verify-arg_regex-val --description='Verify that the RegExp flag gets one of the appropriate values'
    set --local -- regex_matchable_args sub-command initials
    if ! contains -- {$_flag_value} {$regex_matchable_args}
        echo (format text dim 'sub-abbr')(format text dim (format text color white ':')) 'Expected value among:' (format background black --bright {$regex_matchable_args})
        return 1
    end
end
