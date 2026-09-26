---
comments: true
icon: lucide/funnel
description: Filter the listed identifier by their command-line arguments.
---

# Positionals
[List](./index.md){data-preview} accepts the first 2 positional arguments accepted by [Add][add]{data-preview}

| Name | Position |
| :--: | :------: |
| Initial Arguments | `1`:`-2` |
| Sub-Command | `-1` |

They are passed exactly as passed to [Add][add]{data-preview}, but without the [Expansion][expansion]{data-preview}, since it is [not part of their identifier](./index.md#output){data-preview}.

After they are provided, only the context-aware sub-command abbreviations whose identifiers match the provided positional arguments will be listed.

!!! example "List identifiers for a specific Base-Command"
    ```fish {title="Jujutsu"}
    sub-abbr identity list jj
    ```
    ```fish {title="Nix3"}
    sub-abbr identity list nix
    ```
!!! example "List identifiers further filtered by sub-commands"
    ```fish {title="Jujutsu log"}
    sub-abbr identity list jj log
    ```
    ```fish {title="Nix3 shell"}
    sub-abbr identity list nix shell
    ```

[add]: ../../../Add/index.md
[expansion]: ../../../../Positionals/Expansion.md
