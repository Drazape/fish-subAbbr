---
comments: true
icon: lucide/id-card
description: Manage context-aware Sub-Command abbreviations by their identifiers
---

# Identity
Manage context-aware Sub-Command abbreviations by their identifiers

## Properties
|    Name    | Parent |
| :--------: | :----: |
| `identity` |  None  |

## Arguments: Positionals: Sub-Commands
1. [**List**](Sub-Commands/List/index.md){data-preview}: Get identities of loaded abbrs
2. [**Erase**](Sub-Commands/Erase.md){data-preview}: Erase an abbr by its identifier

!!! info "Why separate data inputs"
    While *Erase* could have simply used the same intuitive input as *List*, that is not done because Fish only supports Lists as the built-in data structures. If we were to use the input that List accepts, then that would itself be several tokens, that is, a list on its own.
    Essentially, the user storing multiple identifiers (for any purpose) would have to work it around somehow; that could be possibly done by:

    - Storing a [list of variable strings that each point to a separate identifier][dereference-variables]. This method is native to Fish, and is easier. If this method is used, if the identifiers are to be passed around—which is their entire purpose, one would have to either make the variables global, or call the command repeatedly; this easily makes this method impractical for all most scenarios.
    - Storing each of the identifiers as a parsable string in a List, which is later parsed by the commands. This is the current internal implementation, since it is the only implementation possible out of the 2 to be directly embedded into the command.

    If an internal implementation is not maintained, each of the commands the identifiers are passed to would have to manually do this labor.

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr add … <CREATION FLAGS> (?:`--`) …
```

[dereference-variables]: https://fishshell.com/docs/current/language.html#dereferencing-variables "Official Fish Shell documentaiton on Dereferencing variables"
