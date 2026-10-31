---
comments: true
icon: lucide/landmark
description: Work-around for multiple different *Initial Arguments* permutations
---

# Multi *Initial Args* support
Context-aware abbreviations must use the [*Regular Expressions* switch][regexp]{data-preview}, at least with the `subcommand` scope, whenever the same [*Sub-Command*][subcommand]{data-preview} is being abbreviated more than once in the same [*Base Command*][add-base]{data-preview} (different [*Initial Arguments*][initials]{data-preview}).  

!!! info "Reason: `abbr` limitation"
    The reason is that you can't have more than one abbreviation for a *Sub-Command* and *Base Command* pair without using the *Regular Expression* switch.  

    This is because of the internal implementation of Fish's builtin: [`abbr`][internal-abbr].  
    `abbr` identifies an abbreviation as a pair of the *Sub-Command* and *Base Command*, and an identifier can be assigned to only a single abbreviation.

    Any attempt to create any more with different *Initial Arguments* will result in overwriting of the older one — because the *Initial Arguments* are a concept exclusive to `awabbre`.  

    Such a scenario is worked-around using the *Regular Expression* flag.
    When used, this flag allows us to have custom identifiers for the abbreviations.  
    Therefore, `awabbre` internally uses its *Function* switch to parse the `commandline`, letting us create as many abbreviations for the same *Sub-Command* as we want.

## Cases
!!! tip "Different *Initial Args*"
    In cases where
    - The *Sub-Command* is at the same index in all the occurrences
    - The *Expansion* is the same
    You can use *Regular Expressions* at the *Initial Arguments* to match the different *Initial Arguments* instead.
    !!! example "Jujutsu: *interactive* flag"
        The same flag, `--interactive`, is supported on 4 different sub-commands of `jj`.
        Instead of creating 4 different context-aware abbreviations by needlessly matching the *Sub-Command* with *Regular Expressions*
        ```fish { title="Definition" .no-select }
        awabbre add --regex=initials --base=jj -- 'commit|restore|split|squash' -i --interactive
        ```

### Different Indexes
You need to use this workaround in case the same *Sub-Command* is used at different levels of positionals.
!!! example "Jujutsu: `log`"
    For both `jj operation l` and `jj l` to co-exist (even if they have the same expansion), you must create 2 context-aware abbreviations.
    ```fish {title="Definitions"}
    awabbre add --base=jj --regex=sub-command -- l{,og}
    awabbre add --base=jj --regex=sub-command -- operation l{,og}
    ```

### Different *Expansions*
The easiest way to create such context-aware abbreviations is creating them as separate abbreviations.
!!! example "Jujutsu: different `-r` expansions"
    In Jujutsu, the sub-commands `diff` and `log` both accept the `-r` short flag, but long variants slightly differ for each of the sub-command.  
    For `log` the long variant is `--revision`, while for `diff`, it's `--revisions` (notice the `s` suffix).

    We can simply use *Regular Expressions* on the *Sub-Command* to add them as separate context-aware abbreviations that are able to co-exist.
    ```fish {title="definitions"}
    awabbre add --base=jj --regex=sub-command -- log -r --revision
    awabbre add --base=jj --regex=sub-command -- diff -r --revisions # notice the `s` suffix
    ```

!!! info "Alternative with a single abbreviation"
    In this case, you can combine *Regular Expressions* on the *Initial Arguments* (instead of the *Sub-Command*), along with the [*Expander*][expander]{data-preview} switch to achieve equivalent results.
    You would match all the different Initial Arguments that are accepted with *Regular Expressions*, and use the *Expander* to parse the command-line, dynamically outputting the respective [*Expansions*][expansion]{data-preview}
    !!! note "No Limitations"
        All the arguments in an index by a single abbreviation in the lowest-level back-end. We don't do that simply because of convenience.


[relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "GitHub discussion on the Fish Shell repository"){ data-preview .md-button .md-button--primary }

[initials]: ../../Reference/Arguments/Common-Values/Components/Initial-Arguments.md
[subcommand]: ../../Reference/Arguments/Common-Values/Components/Sub-Command.md
[expansion]: ../../Reference/Arguments/Common-Values/Components/Expansion.md
[regexp]: ../../Reference/Arguments/Sub-Commands/Add/Switches/Regular-Expression.md
[expander]: ../../Reference/Arguments/Sub-Commands/Add/Switches/Expander.md
[internal-abbr]: https://fishshell.com/docs/current/cmds/abbr.html "The internal abbreviation backend used by awabbre"
[add-base]: (../../Reference/Arguments/Sub-Commands/Add/Switches/Base.md)
