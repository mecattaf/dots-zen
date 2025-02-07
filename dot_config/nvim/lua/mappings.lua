local function map(mode, keys, command)
  api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true })
end

local active = false
function Minimal()
  local opt = vim.o
  if active then
    opt.number = true
    opt.showmode = false
    opt.showtabline = 2
    opt.laststatus = 2
    opt.foldcolumn = '0'
  else
    opt.number = false
    opt.relativenumber = false
    opt.showmode = true
    opt.showtabline = 0
    opt.laststatus = 0
    opt.foldcolumn = '2'
  end
  active = not active
end

-- Normal Map
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprev<CR>")
map("n", "hs", ":split<CR>")
map("n", "vs", ":vs<CR>")

-- Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>")
map("n", "<leader>h", ":split +terminal | startinsert<CR>")

-- Save
map("i", "<C-S>", "<ESC>:w<CR><Insert>")
map("n", "<C-S>", ":w<CR>")

-- Buffer
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>t", ":enew<CR>")
map("n", "<ESC>", ":nohlsearch<CR>")

-- Minimal toggle
map("n", "<leader>m", ":lua Minimal()<CR>")
map("n", "<leader>n", ":set relativenumber!<CR>")

-- Zen mode and Twilight toggle
map("n", "<leader>z", ":ZenMode<CR>")
map("n", "<leader>u", ":Twilight<CR>")  

-- Telescope to search for a string
map("n", "<leader>f", ":Telescope grep_string<CR>")

-- NvimTree
map("n", "<C-S-B>", ":NvimTreeToggle<CR>")
map("n", "<C-B>", ":NvimTreeFocus<CR>")

-- Insert Map
map("i", "<C-E>", "<End>")
map("i", "<C-A>", "<Home>")

-- Shift tab
map("i", "<S-TAB>", "<ESC><<<Ins>")

-- Glow.nvim mapping
map("n", "<leader>g", ":Glow<CR>")

-- Image handling
map("n", "<leader>p", "<cmd>PasteImage<cr>")

-- Kitty REPL
map("n", "<leader>;r", "<cmd>KittyREPLRun<cr>")
map("x", "<leader>;s", "<cmd>KittyREPLSend<cr>")
map("n", "<leader>;s", "<cmd>KittyREPLSend<cr>")
map("n", "<leader>;c", "<cmd>KittyREPLClear<cr>")
map("n", "<leader>;k", "<cmd>KittyREPLKill<cr>")
map("n", "<leader>;l", "<cmd>KittyREPLRunAgain<cr>")
map("n", "<leader>;w", "<cmd>KittyREPLStart<cr>")

-- Folding (nvim-ufo)
map("n", "zR", "<cmd>lua require('ufo').openAllFolds()<cr>")
map("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>")
map("n", "zr", "<cmd>lua require('ufo').openFoldsExceptKinds()<cr>")
map("n", "zm", "<cmd>lua require('ufo').closeFoldsWith()<cr>")
map("n", "K", "<cmd>lua local winid = require('ufo').peekFoldedLinesUnderCursor() if not winid then vim.lsp.buf.hover() end<cr>")

-- Git integration
map("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
map("n", "<leader>ng", "<cmd>Neogit<cr>")

-- GitHub integration
map("n", "<leader>oi", "<cmd>Octo issue list<cr>")
map("n", "<leader>op", "<cmd>Octo pr list<cr>")

-- Murmur (Speech-to-text)
map("n", "<C-\\>", ":Murmur<CR>")
