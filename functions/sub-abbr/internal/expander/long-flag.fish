function _sub-abbr_internal_expander_long-flag --description='Expand flag: short → long' --argument-names={longFlag,shortFlag_value}
    echo -n --{$longFlag}=
    string sub --start=3 -- {$shortFlag_value}
end
