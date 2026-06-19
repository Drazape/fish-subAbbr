# Package Tree
The packages are organised in a tree data-structure

!!! note "Standard Only"
    This is just a standard followed by the official repository. Other repositories and packages may choose to make their own structures.

## Data Types
1. **Groups**: A collection of packages or other groups
2. **Packages**: Executable functions providing abbreviations

## Ranks
`0` Universal
:   Before the Root group (1st group) comes the universal group (group zero).
    It has no element in it's path, and all the other root groups stem from it.
    This group cannot be preceded by any other group.

`1` Roots/Sources
:   These are the groups that stem from the Universal group.
    The standard is to use this group for the package source.
    !!! info "Official Root Group name"
        The root group name reserved for official package in the official repository is simply `official`.

`2:-2` Collections
:   Collections of packages and other groups. Used by users to easily enable a group of packages without curating them themselves.

`2/-2` Shelfs
:   Same as collections, but strictly contains only packages.

`-1` Packages/Leaves
:   Executables containing abbreviations.
    Used by users to selectively enable abbreviation sets

!!! note "Structure Usage"
    It is upto the repository helper used by the user to decide upon how to make use of this structure.
