begin
    set --local exec_name nh
    set --local exec_section _{$exec_name}
    function _sub-abbr_pkg{$exec_section} --description='context-aware expansions for nh' --on-event=sub-abbr{s,$exec_section} --inherit-variable=exec_name
        # os: allow root
        sub-abbr add --degrade --expander --regex=sub-command -- run0 {$exec_name} os '(switch|boot|build\-image|build\-vm|rollback|test)' '_sub-abbr_lib_expander_append --bypass-root-check'
    end
end
