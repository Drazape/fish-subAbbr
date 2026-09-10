---
comments: true
icon: lucide/landmark
description: Multiple Base-Command permutations
---

# Multi *Base-Command* support
It is recommended that pacakges use the [*RegExp* switch][regexp]{data-preview} whenever the same [*Sub-Command*][subcommand]{data-preview} is being abbreviated more than once in the same *Base Command* (different [*Initial Arguments*][initials]{data-preview}, other than the *Base Command*).  
This allows users to create *Sub-Command* Abbreviations with multiple *Base Commands* easily, without having to parse RegExp themselves.

!!! abstract "Reason: `abbr` limitation"
    The reason is that you can't have more than one abbreviation for a *Sub-Command* and *Base Command* pair without using the *RegExp* switch.  

    This is because of the internal implementation of Fish's builtin: [`abbr`][internal-abbr].  
    `abbr` identifies an abbreviation as a pair of the *Sub-Command* and *Base Command*, and an identifier can be assigned to only a single abbreviation.

    Any attempt to create any more with different *Initial Arguments* (other than the *Base Command*) will result in overwriting of the older one — because the *Initial Arguments* are a concept exclusive to `sub-abbr`.  

    Such a scenario is worked-around using the *RegExp* flag.
    When used, this flag allows us to have custom identifiers for the abbreviations.  
    Therefore, `sub-abbr` internally uses its *Function* switch to parse the `commandline`, letting us create as many abbreviations for the same *Sub-Command* as we want.

[relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "GitHub discussion on the Fish Shell repository"){ data-preview .md-button .md-button--primary }

[regexp]: ../../Arguments/Sub-Commands/Add/Switches/Regular-Expression.md
[subcommand]: ../../Arguments/Positionals/Sub-Command.md
[initials]: ../../Arguments/Positionals/Initial-Arguments.md
[internal-abbr]: https://fishshell.com/docs/current/cmds/abbr.html "The internal abbreviation backend used by sub-abbr"
