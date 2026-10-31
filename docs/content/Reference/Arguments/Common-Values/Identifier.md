---
comments: true
icon: lucide/hash
description: A minimal distinct string that identifies an abbreviation
---

# Identifier
The *Identifier* is a **minimal content-addressed string** that distinctively identifies a context-aware abbreviation created with [Add][add-subcommand]{data-preview}.

[add-subcommand]: ../Sub-Commands/Add/index.md

## Use
These *Identifiers* can be specified to other `awabbre` sub-commands and external tools to refer to a specific abbreviations.

## Obtainment
The Identifiers associated with an abbreviation is returned by [List][list-subcommand]{data-preview}.

[list-subcommand]: ../Sub-Commands/List/index.md

## Composition
The *Identifier* comprises of only elements that determine what value is matched on the command-line.   
That is, the components that determine details like what the abbreviation expands to, and where the cursor is placed, are not part of the identifier.  
In other words, the identifier is kept minimal, with only those components that are necessary for keeping each abbreviation distinct from others.

The following components are part of the identifier:

- [*Regular Expression*][regex-switch]{data-preview} (*Initial Arguments* only)
- [*Base Command*][base-switch]{data-preview}
- [*Initial Arguments*][initials-component]{data-preview}
- [*Sub-Command*][subcommand-component]{data-preview}

!!! note "Overwriting"
    If an abbreviation is added with the same *Identifier* as an existing one, the existing abbreviation will be overwritten with the new expansion components.
    !!! example "Showcase"
        The *Identifier* `=: string  match -i` can identify each of the following example abbreviation definitions:

        - `awabbre add --base=string -- match -i --ignore-case`
        - `awabbre add --base=string --expander --regard-flags --regex=sub-command --set-cursor --unprefix -- -- match -i --ignore-case`
        - `awabbre add --base=string -- match -i --index`

### Format
```
[r|=]: <BASES>…  <INITIALS>… <SUB-COMMAND>
```

`[r|=]`
:   The prefix indicates how the *Initials* are matched
    - [Regular Expression][regex-switch]{data-preview} (`r`)
    - Fixed String (`=`)

`<BASES>…`
:   These are a variable number of [*Base Commands*][base-switch]{data-preview}, separated by space, and escaped as if on the command-line.

`<INITIALS>…`
:   These are a variable number of [*Initial Arguments*][initials-component]{data-preview}, separated by space, and escaped as if on the command-line.

!!! info "Bases and Initials separation"
    Internally, both the *Base Commands* and *Initial Arguments* are escaped as if on the command-line, so a single unescaped space can be used to separate the elements they comprise amongst themselves.

    Since both *Base Commands* and *Initial Arguments* are variable-length, they must be separated with one or more characters that are escaped on the command-line.  
    The chosen characters are two unescaped spaces (`  `).

    If two spaces were to hypothetically occur in one of the said components, they would be escaped as `\ \ `, and thus not be mistaken as the separator.

`<SUB-COMMAND>`
:   This is the [*Sub-Command*][subcommand-component]{data-preview} that the abbreviation expands to, escaped as if on the command-line.

!!! info "Implementation of Storing Identifiers"
    `awabbre` does not separately maintain a database of identifiers. Instead, it calculates the identifier of each abbreviation on-the-fly from the components that are stored for each abbreviation.  
    The output from `abbr --show` is parsed to get the identifier encoded into the internal function name that expands the abbreviation, which is further parsed to generate a human-intuitive identifier.

    Other than the function name, if the abbreviation uses *Regular Expressions* to match the *Sub-Command* (the internal requirement), a further-escaped version of the identifier is additionally used to identify the abbreviation internally also for the built-in `abbr` command.

[regex-switch]: ../Sub-Commands/Add/Switches/Regular-Expression.md
[base-switch]: ../Sub-Commands/Add/Switches/Base.md
[initials-component]: ./Components/Initial-Arguments.md
[subcommand-component]: ./Components/Sub-Command.md
