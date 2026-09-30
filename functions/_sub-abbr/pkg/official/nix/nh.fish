begin
    set --local -- exec_name nh
    function _sub-abbr_pkg_official_nix_{$exec_name} --description='Modern helper' --inherit-variable=exec_name
        # os: allow root
        _sub-abbr_internal_default-prefix
        for prefix in {$subabbr_prefix}
            sub-abbr add --unprefix --expander --regex --base={$subabbr_prefix} -- {$exec_name} os '(switch|boot|build\-image|build\-vm|rollback|test)' '_sub-abbr_lib_expander_append --bypass-root-check'
        end
    end
end
