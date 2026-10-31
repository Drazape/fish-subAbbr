function _awabbre_pkg_official_nix_nix3 --description='Flakes experiment'
    set --local -- awabbre{,} add --base=nix --
    $awabbre {,env\ }shell
    $awabbre fmt 'formatter run'
end
