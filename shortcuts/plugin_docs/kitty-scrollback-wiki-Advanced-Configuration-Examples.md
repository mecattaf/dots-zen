<p align="center"><b>ksb_builtin_get_text_all</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_01_ksb_builtin_get_text_all.gif">
<a href="ksb_builtin_get_text_all">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [builtin.lua#L3-L7](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/lua/kitty-scrollback/configs/builtin.lua#L3-L7)
```lua
{
  kitty_get_text = {
    extent = 'all',
  },
},
```

---

<p align="center"><b>ksb_example_get_text_all_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_02_ksb_example_get_text_all_plain.gif">
<a href="ksb_example_get_text_all_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L62-L67](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L62-L67)
```lua
{
  kitty_get_text = {
    extent = 'all',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_builtin_last_cmd_output</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_03_ksb_builtin_last_cmd_output.gif">
<a href="ksb_builtin_last_cmd_output">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [builtin.lua#L8-L12](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/lua/kitty-scrollback/configs/builtin.lua#L8-L12)
```lua
{
  kitty_get_text = {
    extent = 'last_cmd_output',
  },
},
```

---

<p align="center"><b>ksb_example_get_text_last_cmd_output_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_04_ksb_example_get_text_last_cmd_output_plain.gif">
<a href="ksb_example_get_text_last_cmd_output_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L80-L85](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L80-L85)
```lua
{
  kitty_get_text = {
    extent = 'last_cmd_output',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_builtin_last_visited_cmd_output</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_05_ksb_builtin_last_visited_cmd_output.gif">
<a href="ksb_builtin_last_visited_cmd_output">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [builtin.lua#L13-L17](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/lua/kitty-scrollback/configs/builtin.lua#L13-L17)
```lua
{
  kitty_get_text = {
    extent = 'last_visited_cmd_output',
  },
},
```

---

<p align="center"><b>ksb_example_get_text_last_visited_cmd_output_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_06_ksb_example_get_text_last_visited_cmd_output_plain.gif">
<a href="ksb_example_get_text_last_visited_cmd_output_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L98-L103](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L98-L103)
```lua
{
  kitty_get_text = {
    extent = 'last_visited_cmd_output',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_example_callbacks</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_07_ksb_example_callbacks.gif">
<a href="ksb_example_callbacks">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L24-L61](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L24-L61)
```lua
function()
  local msg = {}
  return {
    callbacks = {
      after_setup = function()
        vim.defer_fn(function()
          table.insert(
            msg,
            '# kitty-scrollback after_setup callback triggered @ ' .. vim.fn.strftime('%c')
          )
        end, 1000)
      end,
      after_launch = function()
        vim.defer_fn(function()
          table.insert(
            msg,
            '# kitty-scrollback after_launch callback triggered @ ' .. vim.fn.strftime('%c')
          )
        end, 2000)
      end,
      after_ready = function(kitty_data, opts)
        vim.defer_fn(function()
          vim.cmd.startinsert()
          table.insert(
            msg,
            '# kitty-scrollback after_ready callback triggered @ ' .. vim.fn.strftime('%c')
          )
          table.insert(msg, '# kitty_data:')
          table.insert(msg, '# ' .. vim.fn.json_encode(kitty_data))
          table.insert(msg, '# opts:')
          table.insert(msg, '# ' .. vim.fn.json_encode(vim.inspect(opts)))
          vim.api.nvim_buf_set_lines(0, 0, -1, false, msg)
          vim.cmd.stopinsert()
        end, 3000)
      end,
    },
  }
end,
```

---

<p align="center"><b>ksb_example_status_win_autoclose</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_08_ksb_example_status_win_autoclose.gif">
<a href="ksb_example_status_win_autoclose">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L292-L296](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L292-L296)
```lua
{
  status_window = {
    autoclose = true,
  },
},
```

---

<p align="center"><b>ksb_example_status_win_show_timer</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_09_ksb_example_status_win_show_timer.gif">
<a href="ksb_example_status_win_show_timer">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L302-L311](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L302-L311)
```lua
{
  status_window = {
    show_timer = true,
  },
  callbacks = {
    after_setup = function()
      vim.loop.sleep(8000)
    end,
  },
},
```

---

<p align="center"><b>ksb_example_status_win_vim</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_10_ksb_example_status_win_vim.gif">
<a href="ksb_example_status_win_vim">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L312-L318](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L312-L318)
```lua
{
  status_window = {
    icons = {
      nvim = '',
    },
  },
},
```

---

<p align="center"><b>ksb_example_status_win_simple</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_11_ksb_example_status_win_simple.gif">
<a href="ksb_example_status_win_simple">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L319-L323](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L319-L323)
```lua
{
  status_window = {
    style_simple = true,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_first_cmd_output_on_screen</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_12_ksb_example_get_text_first_cmd_output_on_screen.gif">
<a href="ksb_example_get_text_first_cmd_output_on_screen">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L68-L73](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L68-L73)
```lua
{
  kitty_get_text = {
    extent = 'first_cmd_output_on_screen',
    ansi = true,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_first_cmd_output_on_screen_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_13_ksb_example_get_text_first_cmd_output_on_screen_plain.gif">
<a href="ksb_example_get_text_first_cmd_output_on_screen_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L74-L79](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L74-L79)
```lua
{
  kitty_get_text = {
    extent = 'first_cmd_output_on_screen',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_last_non_empty_output</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_14_ksb_example_get_text_last_non_empty_output.gif">
<a href="ksb_example_get_text_last_non_empty_output">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L86-L91](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L86-L91)
```lua
{
  kitty_get_text = {
    extent = 'last_non_empty_output',
    ansi = true,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_last_non_empty_output_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_15_ksb_example_get_text_last_non_empty_output_plain.gif">
<a href="ksb_example_get_text_last_non_empty_output_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L92-L97](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L92-L97)
```lua
{
  kitty_get_text = {
    extent = 'last_non_empty_output',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_screen</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_16_ksb_example_get_text_screen.gif">
<a href="ksb_example_get_text_screen">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L104-L109](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L104-L109)
```lua
{
  kitty_get_text = {
    extent = 'screen',
    ansi = true,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_screen_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_17_ksb_example_get_text_screen_plain.gif">
<a href="ksb_example_get_text_screen_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L110-L115](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L110-L115)
```lua
{
  kitty_get_text = {
    extent = 'screen',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_selection</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_18_ksb_example_get_text_selection.gif">
<a href="ksb_example_get_text_selection">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L116-L121](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L116-L121)
```lua
{
  kitty_get_text = {
    extent = 'selection',
    ansi = true,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_selection_plain</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_19_ksb_example_get_text_selection_plain.gif">
<a href="ksb_example_get_text_selection_plain">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L129-L134](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L129-L134)
```lua
{
  kitty_get_text = {
    extent = 'selection',
    ansi = false,
  },
},
```

---

<p align="center"><b>ksb_example_get_text_selection_keep_selection</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_20_ksb_example_get_text_selection_keep_selection.gif">
<a href="ksb_example_get_text_selection_keep_selection">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L122-L128](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L122-L128)
```lua
{
  kitty_get_text = {
    extent = 'selection',
    ansi = true,
    clear_selection = false,
  },
},
```

---

<p align="center"><b>ksb_example_highlight_overrides</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_21_ksb_example_highlight_overrides.gif">
<a href="ksb_example_highlight_overrides">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L135-L180](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L135-L180)
```lua
function()
  for i = 0, 15 do
    vim.g['terminal_color_' .. i] = 'Cyan'
  end
  return {
    highlight_overrides = {
      KittyScrollbackNvimStatusWinNormal = {
        fg = '#ee82ee',
        bg = '#ee82ee',
      },
      KittyScrollbackNvimStatusWinHeartIcon = {
        fg = '#ff0000',
        bg = '#4b0082',
      },
      KittyScrollbackNvimStatusWinSpinnerIcon = {
        fg = '#000099',
        bg = '#4b0082',
      },
      KittyScrollbackNvimStatusWinReadyIcon = {
        fg = '#4b0082',
        bg = '#ffa500',
      },
      KittyScrollbackNvimStatusWinKittyIcon = {
        fg = '#ffa500',
        bg = '#000099',
      },
      KittyScrollbackNvimStatusWinNvimIcon = {
        fg = '#008000',
        bg = '#000099',
      },
      KittyScrollbackNvimPasteWinNormal = {
        link = 'IncSearch',
      },
      KittyScrollbackNvimPasteWinFloatBorder = {
        link = 'IncSearch',
      },
      KittyScrollbackNvimPasteWinFloatTitle = {
        link = 'IncSearch',
      },
      KittyScrollbackNvimVisual = {
        bg = 'Pink',
        fg = 'Black',
      },
    },
  }
end,
```

---

<p align="center"><b>ksb_example_visual_selection_highlight_mode_reverse</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_22_ksb_example_visual_selection_highlight_mode_reverse.gif">
<a href="ksb_example_visual_selection_highlight_mode_reverse">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L181-L183](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L181-L183)
```lua
{
  visual_selection_highlight_mode = 'reverse',
},
```

---

<p align="center"><b>ksb_example_keymaps_custom</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_23_ksb_example_keymaps_custom.gif">
<a href="ksb_example_keymaps_custom">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L184-L197](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L184-L197)
```lua
function()
  vim.keymap.set({ 'v' }, 'sY', '<Plug>(KsbVisualYankLine)', {})
  vim.keymap.set({ 'v' }, 'sy', '<Plug>(KsbVisualYank)', {})
  vim.keymap.set({ 'n' }, 'sY', '<Plug>(KsbNormalYankEnd)', {})
  vim.keymap.set({ 'n' }, 'sy', '<Plug>(KsbNormalYank)', {})
  vim.keymap.set({ 'n' }, 'syy', '<Plug>(KsbYankLine)', {})
  vim.keymap.set({ 'n' }, 'q', '<Plug>(KsbCloseOrQuitAll)', {})
  vim.keymap.set({ 'n', 't', 'i' }, 'ZZ', '<Plug>(KsbQuitAll)', {})
  vim.keymap.set({ 'n' }, '<tab>', '<Plug>(KsbToggleFooter)', {})
  vim.keymap.set({ 'n', 'i' }, '<cr>', '<Plug>(KsbExecuteCmd)', {})
  vim.keymap.set({ 'n', 'i' }, '<c-v>', '<Plug>(KsbPasteCmd)', {})
  vim.keymap.set({ 'v' }, '<leader><cr>', '<Plug>(KsbExecuteVisualCmd)', {})
  vim.keymap.set({ 'v' }, '<leader><c-v>', '<Plug>(KsbPasteVisualCmd)', {})
end,
```

---

<p align="center"><b>ksb_example_keymaps_disabled</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_24_ksb_example_keymaps_disabled.gif">
<a href="ksb_example_keymaps_disabled">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L198-L200](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L198-L200)
```lua
{
  keymaps_enabled = false,
},
```

---

<p align="center"><b>ksb_example_paste_win_filetype</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_25_ksb_example_paste_win_filetype.gif">
<a href="ksb_example_paste_win_filetype">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L201-L235](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L201-L235)
```lua
{
  paste_window = {
    filetype = 'markdown',
  },
  callbacks = {
    after_ready = vim.schedule_wrap(function()
      local msg = {
        '',
        '\t',
        '',
        '# kitty-scrollback.nvim example',
        '',
        '## Change paste window filetype to `markdown`',
        '',
        '```lua',
        'paste_window = {',
        '  filetype = "markdown", -- change this to your desired filetype',
        '},',
        '```',
      }
      local curbuf = vim.api.nvim_get_current_buf()
      vim.cmd.startinsert()
      vim.fn.timer_start(250, function(t) ---@diagnostic disable-line: redundant-parameter
        if curbuf ~= vim.api.nvim_get_current_buf() then
          vim.fn.timer_stop(t)
          vim.api.nvim_buf_set_lines(0, 0, -1, false, msg)
          vim.cmd.stopinsert()
          vim.fn.setcursorcharpos(2, 4)
        end
      end, {
        ['repeat'] = 12,
      })
    end),
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_hide_mappings</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_26_ksb_example_paste_win_hide_mappings.gif">
<a href="ksb_example_paste_win_hide_mappings">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L236-L240](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L236-L240)
```lua
{
  paste_window = {
    hide_footer = true,
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_highlight_as_float</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_27_ksb_example_paste_win_highlight_as_float.gif">
<a href="ksb_example_paste_win_highlight_as_float">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L241-L247](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L241-L247)
```lua
{
  paste_window = {
    highlight_as_normal_win = function()
      return false
    end,
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_register_disabled</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_28_ksb_example_paste_win_register_disabled.gif">
<a href="ksb_example_paste_win_register_disabled">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L253-L257](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L253-L257)
```lua
{
  paste_window = {
    yank_register_enabled = false,
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_register</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_29_ksb_example_paste_win_register.gif">
<a href="ksb_example_paste_win_register">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L248-L252](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L248-L252)
```lua
{
  paste_window = {
    yank_register = '*',
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_winblend</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_30_ksb_example_paste_win_winblend.gif">
<a href="ksb_example_paste_win_winblend">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L258-L262](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L258-L262)
```lua
{
  paste_window = {
    winblend = 50,
  },
},
```

---

<p align="center"><b>ksb_example_paste_win_winopts</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_31_ksb_example_paste_win_winopts.gif">
<a href="ksb_example_paste_win_winopts">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L263-L284](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L263-L284)
```lua
{
  paste_window = {
    winblend = 10,
    winopts_overrides = function()
      local h = vim.o.lines - 5 -- TODO: magic number 3 for footer and 2 for border
      return {
        border = 'solid',
        row = 0,
        col = 0,
        height = h < 1 and 3 or h, -- TODO: magic number 3 for footer
        width = vim.o.columns,
      }
    end,
    footer_winopts_overrides = function()
      return {
        border = 'single',
        title = ' kitty-scrollback.nvim ',
        title_pos = 'center',
      }
    end,
  },
},
```

---

<p align="center"><b>ksb_example_restore_opts</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_32_ksb_example_restore_opts.gif">
<a href="ksb_example_restore_opts">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L285-L291](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L285-L291)
```lua
function()
  vim.o.termguicolors = true
  vim.o.number = true
  return {
    restore_options = true,
  }
end,
```

---

<p align="center"><b>ksb_example_status_win_disabled</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_33_ksb_example_status_win_disabled.gif">
<a href="ksb_example_status_win_disabled">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [example.lua#L297-L301](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/tests/example.lua#L297-L301)
```lua
{
  status_window = {
    enabled = false,
  },
},
```

---

<p align="center"><b>ksb_example_env_nvim_appname</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_34_ksb_example_env_nvim_appname.gif">
<a href="ksb_example_env_nvim_appname">
  <div align="center"><sup>(click for video)<sup></div>
</a>


---

<p align="center"><b>ksb_example_nvim_args_darkblue</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_35_ksb_example_nvim_args_darkblue.gif">
<a href="ksb_example_nvim_args_darkblue">
  <div align="center"><sup>(click for video)<sup></div>
</a>


---

<p align="center"><b>ksb_builtin_checkhealth</b></p>
<img src="https://github.com/mikesmithgh/kitty-scrollback.nvim/wiki/assets/kitty_scrollback_screencapture_36_ksb_builtin_checkhealth.gif">
<a href="ksb_builtin_checkhealth">
  <div align="center"><sup>(click for video)<sup></div>
</a>

**Configuration**

- Source: [builtin.lua#L18-L20](https://github.com/mikesmithgh/kitty-scrollback.nvim/blob/main/lua/kitty-scrollback/configs/builtin.lua#L18-L20)
```lua
{
  checkhealth = true,
},
```

---

