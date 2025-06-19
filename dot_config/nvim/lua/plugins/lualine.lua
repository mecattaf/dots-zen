-- lua/plugins/lualine.lua
-- Fixed Lualine configuration - resolving extensions and cursor flickering

local M = {}

-- Git branch component (reads git status, doesn't modify)
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub('\n', '')
  if branch and branch ~= '' then
    return '  ' .. branch
  end
  return ''
end

-- Custom components
local components = {}

-- Mode component (keeping stock icons as requested)
components.mode = {
  'mode',
  padding = { left = 1, right = 1 },
}

-- Git branch (reads from git, safe with your workflow)
components.branch = {
  git_branch,
  color = { gui = 'bold' },
  cond = function()
    -- Only show if we're in a git repo
    return vim.fn.isdirectory('.git') == 1 or vim.fn.finddir('.git', '.;') ~= ''
  end,
}

-- Git diff (reads from gitsigns data you already have)
components.diff = {
  'diff',
  symbols = { 
    added = ' ', 
    modified = ' ', 
    removed = ' ' 
  },
  colored = true,
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed
      }
    end
  end,
  cond = function()
    return vim.fn.winwidth(0) > 80
  end,
}

-- Filename component
components.filename = {
  'filename',
  file_status = true,
  newfile_status = false,
  path = 0, -- Just filename (minimal)
  symbols = {
    modified = ' ●',
    readonly = ' ',
    unnamed = '[No Name]',
  },
}

-- Search count (as requested)
components.searchcount = {
  'searchcount',
  maxcount = 999,
  timeout = 500,
  cond = function()
    return vim.v.hlsearch == 1 and vim.fn.searchcount().total > 0
  end,
}

-- Recording status (as requested)  
components.recording = {
  function()
    local reg = vim.fn.reg_recording()
    if reg == '' then
      return ''
    end
    return ' REC @' .. reg
  end,
  color = { fg = '#f38ba8', gui = 'bold' },
  cond = function()
    return vim.fn.reg_recording() ~= ''
  end,
}

-- LSP diagnostics (minimal)
components.diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { 
    error = ' ', 
    warn = ' ', 
    info = ' ', 
    hint = ' ' 
  },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

-- Filetype with icon
components.filetype = {
  'filetype',
  colored = true,
  icon_only = false,
}

-- Location
components.location = {
  'location',
  padding = { left = 0, right = 1 },
}

-- Setup function
function M.setup()
  require('lualine').setup({
    options = {
      theme = 'catppuccin',
      -- Minimal separators to match your clean aesthetic
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { 'alpha', 'dashboard' },
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,    -- Only statusline since that's all we use
        refresh_time = 100,   -- Reduced cursor flickering
        events = {            -- Minimal events - only what's actually needed
          'BufEnter',         -- When entering a buffer (file changes)
          'BufWritePost',     -- After saving (git status might change)
          'ModeChanged',      -- Mode changes (normal/insert/visual)
        },
      }
    },
    sections = {
      lualine_a = { components.mode },
      lualine_b = { 
        components.branch,
        components.diff,
      },
      lualine_c = {
        components.filename,
        components.searchcount,
        components.recording,
      },
      lualine_x = {
        components.diagnostics,
        components.filetype,
      },
      lualine_y = { components.location },
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    -- No tabline (you use bufferline)
    tabline = {},
    -- No winbar (you don't use it)
    winbar = {},
    inactive_winbar = {},
    -- Only extensions that definitely exist - removed problematic ones
    extensions = {
      'nvim-tree',    -- You have this
      'lazy',         -- You have this
      'quickfix',     -- Built-in vim feature
    }
  })
end

return M
