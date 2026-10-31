function _awabbre_internal_verify-arg_match-type --description='Verify the match option value'
    set --local -- match_types fixed regex
    if ! contains -- {$_flag_value} {$match_types}
        echo -- (format text dim 'awabbre')(format text dim (format text color white ':')) 'Expected value among:' (format background black --bright {$match_types})'; got' (format background red --bright {$_flag_value})
        return 1
    end
end
