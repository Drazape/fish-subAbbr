function _sub-abbr_internal_verify-arg_more-args --description='Make sure no less arguments are supplied' --argument-names=expected
    set --function supplied (count {$argv[2..]})
    test {$supplied} -ge {$expected} && return

    echo {$output_prefix} expected (format text bold {$expected}+) arguments(format text color white \;) got (format text italics {$supplied})
    return 1
end
