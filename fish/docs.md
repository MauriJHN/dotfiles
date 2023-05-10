# Personal Fish Documentation

This document contains snippets and examples to understand what the config is doing.

## Key Bindings

In order to bind a key, we need the following information:

- [Fish escape sequence](https://fishshell.com/docs/current/language.html#escapes) thrown by the key shortcut we want to use
- [Fish command](https://fishshell.com/docs/current/cmds/bind.html#special-input-functions) or cli call we want to execute when the shortcut is used

### Finding Fish Escape Sequences

Fish provides a useful command to find and extract the configuration for keybindings: `fish_key_reader`

Just run the command and press the key shortcut that needs a binding.

**Example**

```
> fish_key_reader
Press a key:
bind \eB 'do something'
```

In this example, the `Option` (`Alt`) key alongside the `left-arrow` key. Fish outputs the configuration command to bind the key to a specific command. This particular example is useful because it can bind the shortcut to the deletion of a single word by passing in the function `backward-word`.
