---
comments: true
icon: lucide/hand-helping
description: Helper guide
---

# Usage
`sub-abbrs` accepts a single path to a package or a group, where each argument is an element to that path.

## Loading on Selection
- **Group**: all the packages inside (including packages in the nested groups inside)

    !!! tip "Enable all packages"
        Specify the [Universal group](./Package-Tree.md#ranks){data-preview} (no arguments) to load all the installed packages.

- **Package**: ofcourse, only the selected package

---

!!! abstract "Informal Explanation: File System example"
    Think of the package tree like the file system tree that you are familiar with — groups as directories, packages as files.  
    When you read a "directory," instead of getting an error, you concatenate (source) all the files in the directory — as if you did
    ```fish {title="Concatenate each file in a directory"}
    for file in (path filter --type=file -- <dir>/**)
        read --null <{$file}
    end
    ```
    or the less efficient:
    `#!fish cat (path --filter --type=file -- <dir>/**)`
