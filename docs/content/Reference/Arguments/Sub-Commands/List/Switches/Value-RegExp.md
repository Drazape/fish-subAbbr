---
comments: true
icon: lucide/equal-approximately
description: Match the command-line positionals with RegExp
---

# Value RegExp
Match argument values with Regular Expressions

## Properties
| Value | Short |   Long  |     Sub-Command     | Inherited |
| :---: | :---: | :-----: | :-----------------: | :-------: |
| Multiple (scopes) |  `r`  | `regex` | [List][list]{data-preview} | ❌ false |


## Description
By default, the arbitrary values provided as positionals, or to flags, are fixed strings; they are exactly matched to whatever they are filtering to be included.

## Effect
When this switch is enabled for a scope of value, the values for which the scope was enabled are treated as Regular Expressions and matched accordingly.  
This allows much more flexible matching of argument values which would otherwise not be possible with the other built-in filtering options alone.

!!! note "Different than Sub-command match type"
    This switch is different than the [Match](./Match.md){data-preview} switch, which filters the listed identifiers by their sub-command match type as defined during their [addition][add]{data-preview}.  
    Whereas this switch filters the listed identifiers by interpreting the matched values in scope as regular expressions rather than fixed strings.

## Values
The values are **scopes** to which the *Regular Expression* matching applies

!!! note "Default"
    If the option is specified without any value, then all the scopes are enabled for *Regular Expression* matching.

The valid scopes are described in the following table:

| Name | Field | Description |
| :--: | :---: | ----------- |
| `bases` | [*Base* switch](./Base.md){data-preview} | The Base Commands accepted by the abbreviation |
| `initials` | Positionals | The [Initial Arguments][initials]{data-preview} that must precede the [*Sub-Command*][subcommand]{data-preview} |
| `sub-command` | *Sub-Command* switch | The token that is expanded |
| `expansion` | *Expansion* switch | The specification of what the *Sub-Command* expands into |
| `cursor` | [*Set Cursor* switch](../../Add/Switches/Set-Cursor.md){data-preview} | The string that is replaced to position the cursor in its place |

!!! example "List abbreviations for the help switch"
    ```fish {title="Command"}
    awabbre list --value-regexp=sub-command --sub-command='--help|-h'
    ```

!!! example "List abbreviations for triple-character Base Commands"
    ```fish {title="Command"}
    awabbre list --value-regexp=bases --base=-^.{3}$'
    ```


[add]: ../../Add/index.md
[list]: ../index.md

[initials]: ../../../Common-Values/Components/Initial-Arguments.md
[subcommand]: ../../../Common-Values/Components/Sub-Command.md
