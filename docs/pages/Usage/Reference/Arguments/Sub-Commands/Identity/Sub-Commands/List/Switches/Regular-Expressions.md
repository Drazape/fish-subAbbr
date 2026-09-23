---
comments: true
icon: lucide/equal-approximately
description: Match the command-line positionals with RegExp
---

# Regular Expressions
Match the command-line [positionals](../Positionals.md){data-preview} with Regular Expressions

## Properties
| Value | Short |   Long  |     Sub-Command     | Inherited |
| :---: | :---: | :-----: | :-----------------: | :-------: |
|  Type |  `r`  | `regex` | [List][list]{data-preview} |  ❌ false |

By default, the positionals are fixed strings; they are exactly matched to the [Initial Arguments][initials]{data-preview} and the [Sub-Command][subcommand]{data-preview}.

When this switch is enabled, the positionals are treated as [Regular Expressions][regexp] and matched accordingly.  
This allows much more flexible matching of the arguments, which would otherwise not be possible with simply the other built-in filtering options.

!!! note "Different than Sub-command match type"
    This switch is different than the [Match](./Match.md){data-preview} switch, which filters the listed identifiers by their sub-command match type as defined during their [addition][add]{data-preview}.  
    Whereas this switch filters the listed identifiers by interpreting the listed positionals as regular expressions rather than fixed strings.

!!! example "List abbreviations for the Base Commands: Jujutsu and Nix3"
    ```fish {title="Command"}
    sub-abbr identity list --regex 'jj|nix'
    ```
!!! example "List abbreviations for the help switch across all commands"
    ```fish {title="Command"}
    sub-abbr identity list --regex -- '.*' '--help|-h'
    ```


[list]: ../index.md
[initials]: ../../../../../Positionals/Initial-Arguments.md
[subcommand]: ../../../../../Positionals/Sub-Command.md
[add]: ../../../../Add/index.md
