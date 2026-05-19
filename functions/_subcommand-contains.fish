function _subcommand-contains --argument-names=substring --inherit-variable=subcommand
    test (count {$argv}) -eq 1 || return 1
    string match --quiet --entire {$substring} {$subcommand}
end
