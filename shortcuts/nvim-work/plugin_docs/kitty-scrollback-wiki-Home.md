<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Advanced Configuration](#advanced-configuration)
  - [Examples](#examples)
  - [Useful Configurations](#useful-configurations)
    - [Find text in scrollback buffer / start in backward search](#find-text-in-scrollback-buffer--start-in-backward-search)
  - [Recommended Configurations for other plugins](#recommended-configurations-for-other-plugins)
    - [auto-save.nvim](#auto-savenvim)
    - [auto-session](#auto-session)
    - [barbar.nvim](#barbarnvim)
    - [image.nvim](#imagenvim)
    - [neovim-session-manager](#neovim-session-manager)
  - [Recommended Configurations for shells](#recommended-configurations-for-shells)
    - [Bash](#bash)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Advanced Configuration

## Examples

See [Advanced Configuration Examples](Advanced-Configuration-Examples) for detailed demos of configuration options.

## Useful Configurations

### Find text in scrollback buffer / start in backward search

After kitty-scrollback.nvim loads, enter command-line mode with the search pattern "?" to start searching for text. The following creates a configurations with the name `search` and a mapping to open it with `kitty_mod+f`.

#### Plugin Configuration
```lua
require('kitty-scrollback').setup({
  search = {
    callbacks = {
      after_ready = function()
        vim.api.nvim_feedkeys('?', 'n', false)
      end,
    },
  },
})
```

#### Kitten Configuration
```
map kitty_mod+f kitty_scrollback_nvim --config search
```

## Recommended Configurations for other plugins

Recommended configurations for other plugins that may be impacted by kitty-scrollback.nvim.

### [auto-save.nvim](https://github.com/okuuva/auto-save.nvim)

Disable auto-save.nvim when kitty-scrollback.nvim is active.

```lua
require('auto-save').setup({
  enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= 'true',
})
```

### [auto-session](https://github.com/rmagatti/auto-session)

Disable auto-session when kitty-scrollback.nvim is active.

```lua
require('auto-session').setup({
  auto_session_enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= 'true',
})
```

### [barbar.nvim](https://github.com/romgrk/barbar.nvim)

Hide kitty-scrollback.nvim buffers in the tabline.

```lua
require('barbar').setup({
  auto_hide = vim.env.KITTY_SCROLLBACK_NVIM == 'true' and 1 or -1,
})
```

### [image.nvim](https://github.com/3rd/image.nvim)

Disable image.nvim when kitty-scrollback.nvim is active.

```lua
if vim.env.KITTY_SCROLLBACK_NVIM ~= 'true' then
  require('image').setup()
end
```

Alternatively, if you are using lazy.nvim, then  you can use the `cond` option.
```lua
{
  '3rd/image.nvim',
  cond = vim.env.KITTY_SCROLLBACK_NVIM ~= 'true',
  ...
}
```
If you prefer to have image.nvim enabled, see [#261](https://github.com/mikesmithgh/kitty-scrollback.nvim/issues/261) for additional troubleshooting steps.

### [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)

Disable neovim-session-manager when kitty-scrollback.nvim is active.

```lua
local modes = require('session_manager.config').AutoloadMode
require('session_manager').setup({
  autoload_mode = vim.env.KITTY_SCROLLBACK_NVIM == 'true' and modes.Disabled or modes.LastSession,
})
```

## Recommended Configurations for shells

### Bash
- `kitty-scrollback.nvim` uses [bracketed paste mode](https://cirw.in/blog/bracketed-paste) when sending contents to kitty. `\e[200~` is sent to the terminal to start bracketed paste mode where `\e` represents escape. It is possible that if you have already typed escape and then opened kitty-scrollback.nvim, you will see the text `[200~` before the content you sent to kitty. This is because the first escape causes the start of the message to be `\e\e[200~` and the first `\e` interferes with the second `\e` which is starting bracketed paste mode. kitty-scrollback.nvim previously handled this is versions <= `v4.3.4` by starting the message with a [null character](https://en.wikipedia.org/wiki/Null_character) to avoid the case of two escapes. The start of the message would then look like `\e\0\e[200~` where `\e` is escape and `\0` is the null character. This worked as expected for bash, but causes empty spaces to be displayed for other shells like fish. kitty-scrollback.nvim no longer sends the null character and it is recommended to replace two escapes to a no operation in bash to avoid this scenario.
  - Add the following to your `~/.inputrc` file to remap two escapes to a no operation. [~/.inputrc](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html) is the readline init file that is used by bash to handle custom key bindings. 
    ```sh
    "\e\e": ""
    ```
