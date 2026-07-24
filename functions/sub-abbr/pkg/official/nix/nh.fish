begin
    set --local -- exec_name nh
    function _sub-abbr_pkg_official_nix_{$exec_name} --description='Modern helper' --on-event=sub-abbrs --inherit-variable=exec_name
        # os: allow root
        sub-abbr add --degrade --expander --regex=sub-command -- run0 {$exec_name} os '(switch|boot|build\-image|build\-vm|rollback|test)' '_sub-abbr_lib_expander_append --bypass-root-check'
    end
end
