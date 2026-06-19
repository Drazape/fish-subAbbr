# Expanders
Library functions called by `sub-abbr` (used as the [*Expander*](../../../Arguments/Sub-Commands/Add/Switches/Expander.md){data-preview} function) for expansion.

These are abstractions that can be used instead of using custom functions from scratch to reduce boilerplate code.  
These functions are simply input → output converters; they parse the text inputted to them and generate a result that can be used as the replacement string

## Uses
- Directly as the [*Expander*](../../../Arguments/Sub-Commands/Add/Switches/Expander.md){data-preview} for simple abbreviations
??? note "sub-command pass"
    In this case, the last argument to the function is always the sub-command matched on the command-line
??? info "Usage"
    ```fish { title="Expander" .no-copy .no-select }
    sub-abbr add --expander (?:--) <args> <EXPANDER_FUNCTION>
    ```
- Wrapped
	- Another *Expander*
	- A [Wrapper](../Wrappers/)
