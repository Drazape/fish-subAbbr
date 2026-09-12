---
comments: true
icon: lucide/broom
description: How to erase all context-aware sub-command abbreviations
---

# Erasing all abbreviations
To clear all the context-aware sub-command abbreviations in your current Fish environment, simply execute the following command:
```fish {title="Command"}
sub-abbr identity erase (sub-abbr identity list)
```

!!! bug "Unknown function"
    `sub-abbr` is made in a way to be reproducible and automated for dependency management in Nix environments.  
    This niche case is currently [not supported in Fish][unknown-function-bug], and hence would error out, claiming that it didn't find the function `sub-abbr`.

    For now, you can work this around the same way you work around the use of command substitutions in the place of the base commands:
    ```fish {title="Workaround"}
    begin
        set --local -- subabbr_identifiers (sub-abbr identity list)
        sub-abbr identity erase {$subabbr_identifiers}
    end
    ```

!!! info "Working"
    This works similarly to how commands in the `pacman` package manager work.

    `list` outputs identifiers for all the abbreviations found that are context-aware sub-command abbreviations — separated by newline.
    The command substitution in Fish converts the output into a list of identifiers.
    The entire list is passed to `erase`, clearing all the abbreviations.

[unknown-function-bug]: https://github.com/fish-shell/fish-shell/issues/12996 "Fish bug tracker: error passing output between functions mutating the function path"
