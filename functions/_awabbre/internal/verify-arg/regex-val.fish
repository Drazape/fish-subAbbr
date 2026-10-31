function _awabbre_internal_verify-arg_regex-val --description='Verify that the RegExp flag gets one of the appropriate values'
    set --local -- regex_matchable_args sub-command initials
    if ! contains -- {$_flag_value} {$regex_matchable_args}
        echo -- (format text dim 'awabbre')(format text dim (format text color white ':')) 'Expected value among:' (format background black --bright {$regex_matchable_args})'; got' (format background red --bright {$_flag_value})
        return 1
    end
end
