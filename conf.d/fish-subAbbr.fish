function _fish-subAbbr_uninstall --on-event=fish-subAbbr_uninstall --description='Remove all sub-functions'
    rm ~/.config/fish/functions/_sub-abbr_*.fish
end

function _fish-subAbbr_install --on-event=fish-subAbbr_install --description='Install dependency: fish-helpText; correct sub-function file-names'
    fisher install Drazape/fish-helpText

    cd ~/.config/fish/functions/
    for file in sub-abbr/**.fish
        mv {$file} _(string replace --all -- / _ {$file})
    end
    rm -r ./sub-abbr/
    prevd
end

function _fish-subAbbr_update --on-event=fish-subAbbr_update --description='Update dependency: fish-helpText; redo installation steps'
    fisher update Drazape/fish-helpText
    _fish-subAbbr_uninstall
    _fish-subAbbr_install
end
