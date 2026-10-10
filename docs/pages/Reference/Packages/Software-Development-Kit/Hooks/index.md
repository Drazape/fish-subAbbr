---
comments: true
icon: lucide/fishing-hook
description: Triggers for arbitrary plugins
---

# Hooks
Hooks are triggers that can be used by arbitrary plugins for various purposes to modify and extend the functionality of abbreviations.

## Activation
The hooks are activated through [Fish events](https://fishshell.com/docs/current/language.html#event-handlers "official Fish Shell documentation page: Language#event-handlers"), which loaded functions can listen to.

The hook function can accept these emissions, and use the context tokens passed along as arguments to perform its operations.

## Preference over wrappers
You should use hooks instead of [wrappers](../Wrappers/index.md){data-preview} for everything that is fit to be done with hooks.

!!! note "Prioritize UX"
    Generally, keep the following guidelines in mind when developing a plugin:
    Freedom
    :   If the hook is making it impossible for a user to achieve a result, even if it is probably not the intended result, then it should be a wrapper instead of a hook. Hooks shouldn't limit what the user can do.
    Interface
    :   If a wrapper can provide a better interface for the user, it can co-exist with the hook, but the hook should be the primary interface for the user to interact with the plugin.

### Uniformity
Single interface 
:   The users can manage all the abbreviations through the same interface, without having to refer to a new one for each plugin.

Familiarity
:   Hooks lets the user run the official, familiar `sub-abbr`, without having to learn the additional wrapper program.

### Multiple
There can be multiple hooks for the same event, from multiple plugins.

These hooks perform different operations that might be relevant to multiple plugins.  
Using a wrapper to manage the operations would only allow the user to use one of the plugins, and not the others.
