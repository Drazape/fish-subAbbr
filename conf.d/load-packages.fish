for repository in (realpath -- /usr/share/fish/subAbbr-packages/*)
    set --prepend -- fish_complete_path {$repository}
end
