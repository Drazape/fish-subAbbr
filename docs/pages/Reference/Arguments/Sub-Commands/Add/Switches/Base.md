---
comments: true
icon: lucide/terminal
description: Specify Base Commands accepted by the abbreviation
---

# Base
Specify the Base Commands for which the abbreviation would expand for.

!!! note "Required Switch"
    This is the only switch that is required by [Add](../index.md){data-preview} for the abbreviation to be valid.

## Properties
|   Value  | Short | Long | Sub-Command | Inherited |
| :------: | :---: | :--: | :---------: | :---------: |
| Required / Variable |  `b`  | `base` | [Add](../index.md){data-preview} | ✅ True |

## Details
Relation
:   The *Base Command* must precede the [*Initial Arguments*](../../../Positionals/Initial-Arguments.md){data-preview} on the command-line for the [*Sub-Command*](../../../Positionals/Sub-Command.md){data-preview} to be expanded.

Value
:   The *Base Command* is can be an executable, function, or built-in called by Fish for the execution. It can be a single command or a list of commands for which the abbreviation expands for.

Use-cases
:   Conditionally expanding abbreviations based on if one of the [prefixes](../../../../Configuration/Prefix.md) are used.

:   Abbreviating universal flags supported by multiple Base Commands.

!!! info "Separation from *Initial Arguments*"
    Some abbreviations work for multiple *Base Commands*.  
    The *Initial Arguments* already span a variable amount of tokens; thus, we cannot include yet another variable amount of tokens to the positionals—that slot is already occupied.

    While options are supposed to be optional, they also serve as a way to separate multiple variable lists from one another.  
    This is what this switch is used for—to separate the multiple *Base Commands* from the *Initial Arguments*.

    One might thing that they could have been included in the *Initial Arguments* by matching multiple *Base Commands* with Regex instead of multiple tokens, but that is a limitation with internal Fish abbreviations itself—the *Base Command*, though can be specified multiple times, can only be matched with fixed strings.

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr --base=<BASE-COMMANDS> … (?:--) <initial_arguments> <sub-command> <expansion>
```
