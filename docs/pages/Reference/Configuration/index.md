---
comments: true
icon: lucide/bolt
description: Configuration options—defined in Fish variables.
---

# Configuration
The configuration options for this program are defined in [Fish variables](https://fishshell.com/docs/current/language.html#variables "official Fish Shell documentation page").

## Prefix
Each of the configuration variables are prefixed with `subabbr_`; for example, the variable for the `allow_nonexistent_basecommand` option is `subabbr_allow_nonexistent_basecommand`.

## Scope
These variables can be in any [scope](https://fishshell.com/docs/current/language.html#variable-scope "official Fish Shell documentation page"), and that would not affect the behavior—as long as it reaches the program.

The program isn't made to [inherit (snapshot)](https://fishshell.com/docs/current/cmds/function.html "official Fish Shell documentation page. See the “--inherit-variable” option.") the configuration from the parent scope (`local`, `function`); thus, the scope must be one that can reach the program without inheritance being required (`global`, `universal`).
