begin
    set --local -- exec_name nh
    function _awabbre_pkg_official_nix_{$exec_name} --description='Modern helper' --inherit-variable=exec_name
        # os: allow root
        _awabbre_internal_default-prefix
        for prefix in {$awabbre_prefix}
            awabbre add --unprefix --expander --regex=sub-command --base={$awabbre_prefix} -- {$exec_name} os 'switch|boot|build\-image|build\-vm|rollback|test' '_awabbre_lib_expander_append --bypass-root-check'
        end
    end
end
