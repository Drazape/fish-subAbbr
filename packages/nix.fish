begin
    set --local -- sub_abbr sub-abbr add -- nix
    $sub_abbr {,env\ }shell
    $sub_abbr fmt 'formatter run'
end
