# FAQ

## Telescope & FZF: Differences and Similarities

https://github.com/nvim-telescope/telescope.nvim/issues/719

## How to change Telescope Highlights group?

We have a wide variety of highlight groups so you can customize telescope to your liking.

```viml
highlight TelescopeSelection      guifg=#D79921 gui=bold " Selected item
highlight TelescopeSelectionCaret guifg=#CC241D          " Selection caret
highlight TelescopeMultiSelection guifg=#928374          " Multisections
highlight TelescopeNormal         guibg=#00000           " Floating windows created by telescope

" Border highlight groups
highlight TelescopeBorder         guifg=#ffffff
highlight TelescopePromptBorder   guifg=#ffffff
highlight TelescopeResultsBorder  guifg=#ffffff
highlight TelescopePreviewBorder  guifg=#ffffff

" Highlight characters your input matches
highlight TelescopeMatching       guifg=blue

" Color the prompt prefix
highlight TelescopePromptPrefix   guifg=red
```

To checkout the default values of the highlight groups, check out `plugin/telescope.vim`

## How to add autocmds to telescope prompt?

`TelescopePrompt` is the prompt Filetype. You can customize the Filetype as you would normally.

## How to disable folds inside picker?

```viml
autocmd! FileType TelescopeResults setlocal nofoldenable
```

## Why aren't git pickers working?

Most of the Telescope git pickers will not work properly if you have `color.ui` set to `always` in your git config, as the color codes aren't handled by Telescope.
We recommend setting `color.ui` to `auto` to avoid these issues.