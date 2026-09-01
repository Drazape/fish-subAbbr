function sub-abbrs --description='Package repository helper for sub-abbrs'
    test (count {$argv}) -eq 0 && emit sub-abbrs
    for repo_func in (functions --all | string match --entire --regex -- ^_sub-abbr_pkg_ |
            string match --entire --regex -- ^_sub-abbr_pkg_"$(string join -- _ {$argv})")
        $repo_func
    end
end
