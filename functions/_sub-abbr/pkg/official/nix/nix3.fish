function _sub-abbr_pkg_official_nix_nix3 --description='Flakes experiment'
    set --local -- sub_abbr sub-abbr add --base=nix --
    $sub_abbr {,env\ }shell
    $sub_abbr fmt 'formatter run'
end
