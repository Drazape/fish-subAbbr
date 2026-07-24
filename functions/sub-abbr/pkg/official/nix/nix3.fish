begin
    set --local -- exec_name nix3
    function _sub-abbr_pkg_official_nix_{$exec_name} --description='Flakes experiment' --on-event=sub-abbrs --inherit-variable=exec_name
        sub-abbr add -- {$exec_name} {,env\ }shell
    end
end
