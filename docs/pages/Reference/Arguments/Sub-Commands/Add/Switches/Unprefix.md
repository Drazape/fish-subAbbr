---
comments: true
icon: lucide/arrow-big-down-dash
description: Deactivate `run0` command-prefix toleration
---

# Unprefix
Deactivate [`$subabbr_prefix`][prefix-config]{data-preview} toleration before the Base Command

[prefix-config]: ../../../../Configuration/Prefix.md

Normally, if a token from `$subabbr_prefix` precedes the Base Command on the command-line, it is ignored, and the abbreviation is still performed.  
With this switch enabled for the respective abbreviations, those tokens are no longer respected.

## Properties
| Value | Short |    Long    | Sub-Command | Inherited |
| :---: | :---: | :--------: | :---------: | :-------: |
|  None |  `0`  | `unprefix` |     Add     |  ❌ false |

## Details
Relation
:   *Initial Arguments*: an argument that is one of `$subabbr_prefix` would no longer be specially tolerated

Use-case
:   For abbreviating commands that must be elevated for the expansion to occur

!!! note "internally handled base-prefix: `exec`"
    The command prefix `exec` is especially internally respected, with no switch to available to deactivate the behavior.

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr add … <UNPREFIX FLAG> (?:`--`) …
```

!!! example "abbreviating `run0`"
    Always use `--empower` so that the created files are owned by the calling user, not `root`.
    ```fish {title="command" .no-select}
    sub-abbr add -0s -- run0 {,--empower\ }touch
    ```
    Here, *Unprefix* is used since you typically wouldn't prefix `run0`—the prefixes are usually elevation commands.

!!! example "Expanding only with `run0`"
    Only bypass *root check* on an attempt to run as `root`
    ```fish {title="command" .no-select}
    sub-abbr add -0c run0 nh os switch{,' % --bypass-root-check'}
    ```
