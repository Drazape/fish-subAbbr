function _sub-abbr_internal_verify-arg_match-type --description='Verify the match option value'
    set --local -- match_types fixed regex
    if ! contains -- {$_flag_value} {$match_types}
        echo (format text dim 'sub-abbr')(format text dim (format text color white ':')) 'Expected value among:' (format background black --bright {$match_types})
        return 1
    end
end
