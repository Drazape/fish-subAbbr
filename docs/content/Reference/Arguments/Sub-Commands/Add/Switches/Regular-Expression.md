---
comments: true
icon: lucide/equal-approximately
description: Match command-line arguments with *Regular Expression*s
---

# Regular Expression
Match command-line arguments with *Regular Expression*s

## Properties
|       Values        | Short |   Long  | Sub-Command |    Inherited       |
| :-----------------: | :---: | :-----: | :---------: | :----------------: |
| Multiple & Optional |  `r`  | `regex` | [Add](../index.md){data-preview} | ✅ true (extended) |

## Details
Miscellaneous details about the switch
### Values
`sub-command` (default)
:   Applies to the [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview}

`initials`
:   Applies to the [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview}
### Relation
- The [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview}/[*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview} turns into a RegExp instead of a fixed string (and may require escapes)
- Providing [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} is still necessary, unlike `builtin abbr` where you can directly pass the RegExp to the flag.
- This switch is essential for multiple [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview} permutations paired with the same [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} (`builtin abbr`'s restriction)
!!! tip "Workaround Permutations"
    Use `string escape --style=regex` for [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} for multiple permutations
### Single Token
The *Regular Expression* is only matched against the individual arguments (not the entire command-line)

!!! note "Same boundaries as `builtin abbr`"
    When matching tokens on the command-line (both `sub-command` and `initials`), no leading or trailing tokens are matched by default.
    That is, the inputted query is wrapped as follows: `^(QUERY)$`, retaining the behavior from `builtin abbr`
    !!! example "Example invalid query"
        The query `QUERY` does not match the target `prefix-QUERY-suffix`

    If you aim for the default behavior of `string match --regex`, you must explicitly match the characters around your query by surrounding the said query with the `.*` Regexp pattern.
    !!! example "Matching query by mitigating boundaries"
        The query `.*QUERY.*` matches the query `prefix-QUERY-suffix`.

### Use-case
Matching command-line arguments dynamically
!!! tip "Switch Combo"
    Pair it with [*Expander*](Expander.md "Use a command's output as the *Expansion*"){data-preview} to generate [*Expansions*](../../../Common-Values/Components/Expansion.md "replacement string"){data-preview} based on the current command-line

!!! info "Implementation"
    Sub-Command
    :   It is directly passed to `builtin abbr` with the [*Sub-Command*](../../../Common-Values/Components/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} as the value

    Initial Arguments
    :   [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md "Args preceding"){data-preview} in itself is a `awabbre` exclusive feature. Thus, manually matched

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-commands>… --regex[=<value>…] <creation_flags>… -- <initials> <sub-command> <expansion>
```
