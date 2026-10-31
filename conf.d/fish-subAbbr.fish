function _fish-awabbre_uninstall --on-event=fish-awabbre_uninstall --description='Remove all sub-functions'
    rm ~/.config/fish/functions/_awabbre_*.fish
end

function _fish-awabbre_install --on-event=fish-awabbre_install --description='Install dependencies; parse sub-function file-names'
    fisher install Drazape/fish-helpText
    fisher install Drazape/fish-format

    cd ~/.config/fish/functions/
    for file in awabbre/**.fish
        mv {$file} _(string replace --all -- / _ {$file})
    end
    rm -r ./awabbre/
    prevd
end

function _fish-awabbre_update --on-event=fish-awabbre_update --description='Update dependencies; redo installation steps'
    _fish-awabbre_uninstall
    _fish-awabbre_install
end
