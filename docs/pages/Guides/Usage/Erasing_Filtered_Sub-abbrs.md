---
comments: true
icon: lucide/broom
description: How to erase sub-abbrs filtered with `sub-abbr identity list` in your current Fish environment.
---

# Erasing filtered sub-abbrs
To erase all the context-aware sub-command abbreviations matched to your filter in your current Fish environment, simply pass the filtered list of identifiers to `sub-abbr identity erase` as arguments:
```fish {title="Command"}
sub-abbr identity erase (sub-abbr identity list <filter>)
```

!!! bug "Unknown function"
    `sub-abbr` is made in a way to be reproducible and automated for dependency management in Nix environments.  
    This niche case is [not supported in Fish][unknown-function-bug] versions [4.9.3](https://github.com/fish-shell/fish-shell/releases/tag/4.9.3 "GitHub release") and earlier.  
    Trying this command in unsupported versions would result an error, that claims that it didn't find the function `sub-abbr`.

    For now, you can work this around the same way you work around the use of command substitutions in the place of the base commands:
    ```fish {title="Workaround"}
    begin
        set --local -- subabbr_identifiers (sub-abbr identity list <filter>)
        sub-abbr identity erase {$subabbr_identifiers}
    end
    ```

!!! example "Clear All"
    To clear all the abbreviations, simply don't apply a filter to `sub-abbr identity list`:
    ```fish {title="Command"}
    sub-abbr identity erase (sub-abbr identity list)
    ```
!!! example "Clear sub-abbrs whose sub-command is matched with RegExp"
    To clear all the abbreviations whose sub-command is matched with a RegExp, set the match type to `regex`:
    ```fish {title="Command"}
    sub-abbr identity erase (sub-abbr identity list --match=regex)
    ```
!!! example "Clear sub-abbrs for the Jujutsu command"
    To clear all the abbreviations for the Jujutsu command, simply pass the *Base Command* as a positional argument to `sub-abbr identity list`:
    ```fish {title="Base Command"}
    sub-abbr identity erase (sub-abbr identity list jj)
    ```
    ---
    You can further filter the abbreviations by passing the next sub-command too as the next positional argument:
    ```fish {title="Rebase Sub-command"}
    sub-abbr identity erase (sub-abbr identity list jj rebase)
    ```
    ---
    Furthermore, you can apply the match type to the filter on top of it:
    ```fish {title="Rebase Sub-command with Fixed match"}
    sub-abbr identity erase (sub-abbr identity list --match=fixed jj rebase)
    ```


!!! info "Working"
    This works similarly to how [commands in the Pacman package manager](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans) "example from Arch Wiki: Tips and Tricks: Removing unused packages") work.

    `list` outputs identifiers for all the abbreviations found that are context-aware sub-command abbreviations—separated by newline.
    The command substitution in Fish converts the output into a list of identifiers.
    The entire list is passed to `erase`, clearing all the abbreviations.

[unknown-function-bug]: https://github.com/fish-shell/fish-shell/issues/12996 "Fish bug tracker: error passing output between functions mutating the function path"
