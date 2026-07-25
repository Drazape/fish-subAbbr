function _sub-abbr_pkg_official_nix_nix3 --description='Flakes experiment' --on-event=sub-abbrs --inherit-variable=exec_name
    set --local -- sub_abbr sub-abbr add -- nix
    $sub_abbr {,env\ }shell
    $sub_abbr fmt 'formatter run'
end
