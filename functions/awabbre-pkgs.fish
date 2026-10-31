function awabbre-pkgs --description='Package repository helper for Awabbre packages'
    test (count {$argv}) -eq 0 && emit awabbre-pkgs
    for repo_func in (functions --all | string match --entire --regex -- ^_awabbre_pkg_"$(string join -- _ {$argv})")
        $repo_func
    end
end
