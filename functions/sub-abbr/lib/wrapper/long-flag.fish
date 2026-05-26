function _sub-abbr_lib_wrapper_long-flag --description='Convert flags: short → long'
    argparse --name=(status current-function) --move-unknown 'm/mandatory&' -- {$argv}
    set --local -- initials {$argv[..-3]}
    set --local -- short_flag {$argv[-2]}
    set --local -- long_flag {$argv[-1]}

    set --local -- commandline {$initials} -{$short_flag}
    set --query --local _flag_mandatory && sub-abbr add --set-cursor -- {$commandline} --{$long_flag}=% || sub-abbr add -- {$commandline} --{$long_flag}
    sub-abbr add --expander --regex=sub-command {$argv_opts} -- {$initials} (string escape --style=regex -- -{$short_flag}).+ _sub-abbr_internal_expander_long-flag\ {$long_flag}
end
