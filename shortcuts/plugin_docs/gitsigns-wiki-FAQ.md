### How do I focus the cursor on a pop-up window?

`<C-w>w`

---

### How do I change the color of X?

For every style-able element in Gitsigns, there is an associated highlight group that can be configured/customized. Most well-developed colorschemes will style this for you, however if you want to manually override the default you can do something like:

```viml
:highlight GitSigns<name> guifg=<color> guibg=<color>
```

or in Lua:

```lua
vim.api.nvim_set_hl(0, 'Gitsigns<name>', { fg=<color>, bg=<color> })
```

E.g. for `GitSignsCurrentLineBlame`.

```viml
:highlight GitSignsCurrentLineBlame guifg=white guibg=black
```
```lua
vim.api.nvim_set_hl(0, 'GitsignsCurrentLineBlame', { fg = 'white', bg = 'black' })
```

Alternatively, it is often more useful to link the highlight group to an existing group:

```viml
:highlight link GitSignsCurrentLineBlame Todo
```
```lua
vim.api.nvim_set_hl(0, 'GitsignsCurrentLineBlame', { link = 'Todo' })
```

To see all Gitsigns highlights, see `:help gitsigns`.

To see all currently defined highlight groups run `:highlight`.

To learn more about highlight groups see `:help :highlight`.

---
