---
comments: true
icon: lucide/package
description: Abbreviation frameworks
---

# Wrappers
Library frameworks with independent arguments and working; abstractions over other commands.

These are made to make package development more intuitive when a mere Expansion library isn't enough.  
These functions are not limited to just changing the expansion, but to every aspect of the abbreviation, and beyond.

## Uses
- Directly called from the package instead of calling `sub-abbr`
??? info "Usage"
    ```fish
    <WRAPPER> <args>
    ```
    !!! note "Wrapper Specific Arguments"
        `<args>` depend on the wrapper

- Called by other wrappers
??? example "Example: Mandatory Flags"
    When [To Long](Flag/To-Long.md){data-preview} is used with the *Mandatory* switch, the wrapper internally calls [Mandatory Long](Flag/Mandatory-Long.md){data-preview} to keep things [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself "Wikipedia: Don't Repeat Yourself"){data-preview}
