---
status: new
comments: true
icon: lucide/eye
description: Show definition of a abbr by its identity
---

# Show
Show the definition of context-aware abbreviations as it would be passed to [*Add*][add-subcommand]{data-preview}

## Properties
|  Name  | Positional Values |
| :----: | :---------------: |
| `show` | Optional |

## Details
Positionals
:   **Selective**: To get the definitions of certain abbreviations, use their [identifier](../Common-Values/Identifier.md){data-preview} obtained from the [List sub-command](./List/index.md "Get identities of loaded abbrs"){data-preview}
:   **All**: If no positionals are provided, the definitions for all the abbreviations will be shown

Uses
:   **Machine**: Storing the definition of an abbreviation for redefinition, or modification
:   **Human**: Viewing the definition of an abbreviation for inspection and debugging

!!! info "Implementation"
    The identifier only includes the details that are necessary for two abbreviations to be considered different.  
    All the other details are internally passed to the built-in `abbr` as a cosmetic description.  
    These descriptions contain all the data that is missing from the identifier itself.

    Show parses both the data from the identifier and the description, and puts it together to form a valid definition.

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre show [<IDENTIFIER>…]
```

### Output
#### Delimiter
The entries for each abbreviation is separated by a New-line (`\n`)
```
<definition-1>
<definition-2>
…
```
#### Format
##### Entry
Each entry itself occupies a single line.  
This line contains the definition as it would be passed on the command-line.  

!!! tip "Parsing into tokens"
    One can parse the definition into tokens by passing the entry into `#!fish commandline --tokens-expanded --input=<entry>`.
##### Definition
Each entry is formatted as a valid definition for the [*Add* sub-command][add-subcommand]{data-preview}.  
That is, each of the flags are kept as flags, and the positionals are escaped by being preceded with a `--` token.

!!! tip "Parsing into variables"
    Each definition can be parsed into variables using `argparse`, just like it is done internally by the *Add* sub-command (without validation or the Help flag).  
    Furthermore, the positionals can be stored by their position in `$argv`.
    ```fish {title="Definiton Parsing" .no-copy .no-select}
    argparse \
        b/base=+ \
        r/regex=\* \
        e/expander \
        c/set-cursor=? \
        0/unprefix \
        s/regard-flags \
        -- <definition>…

    set -- initial_args {$argv[1..-3]}
    set -- subcommand {$argv[-2]}
    set -- expansion {$argv[-1]}
    ```
    !!! warning "Internal Parser"
        It would be easier to just use the internal function `_awabbre_internal_identifier-data_individual-info`, but it isn't part of the public API.

[add-subcommand]: ./Add/index.md
