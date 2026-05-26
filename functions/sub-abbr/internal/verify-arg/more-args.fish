function _sub-abbr_internal_verify-arg_more-args --description='Make sure no less arguments are supplied' --argument-names=expected
    set --function supplied (count {$argv[2..]})
    test {$supplied} -ge {$expected} && return

    echo {$output_prefix} expected (set_color --bold){$expected}+(set_color --reset) arguments(set_color white)\;(set_color --reset) got (set_color --italics){$supplied}(set_color --reset)
    return 1
end
