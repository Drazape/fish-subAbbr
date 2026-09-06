---
comments: true
icon: lucide/landmark
description: Multiple Base-Command permutations
---

# Multi *Base-Command* support
Packages should use the [*RegExp* switch][regexp]{data-preview} whenever the same [*Sub-Command*][subcommand]{data-preview} is being abbreviated more than once in the same *Base Command* (different [*Initial Arguments*][initials]{data-preview}, other than the *Base Command*).  
This allows users to create [*Sub-Command*][subcommand]{data-preview} Abbreviations with multiple *Base Commands* easily, without having to parse [RegExp][regexp]{data-preview} themselves.

!!! abstract "Reason: `abbr` limitation"
    The reason is that you can't have more than one abbreviation for a [*Sub-Command*][subcommand]{data-preview} and *Base Command* pair without using the [*RegExp*][regexp]{data-preview} switch.  

    This is because of the internal implementation of Fish's builtin: [`abbr`][internal-abbr].  
    [`abbr`][internal-abbr] identifies an abbreviation as a pair of the [*Sub-Command*][subcommand]{data-preview} and *Base Command*, and an identity can be assigned to only a single abbreviation.

    Any attempt to create any more with different [*Initial Arguments*][initials]{data-preview} (other than the *Base Command*) will result in overwriting of the older one, since the [*Initial Arguments*][initials]{data-preview} are a concept exclusive to `sub-abbr`.  

    Such a scenario is worked-around using the [*RegExp*][regexp]{data-preview} flag.
    When used, this flag allows us to have custom identities for the abbreviations.  
    Therefore, `sub-abbr` internally uses its *Function* switch to parse the `commandline`, enabling us to create as many abbreviations for the same [*Sub-Command*][subcommand]{data-preview} as we want.


[regexp]: ../../Arguments/Sub-Commands/Add/Switches/Regular-Expression.md
[subcommand]: ../../Arguments/Positionals/Sub-Command.md
[initials]: ../../Arguments/Positionals/Initial-Arguments.md
[internal-abbr]: https://fishshell.com/docs/current/cmds/abbr.html "The internal abbreviation backend used by sub-abbr"
[relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "GitHub discussion on the Fish Shell repository"){ data-preview .md-button .md-button--primary }
