local present, neogit = pcall(require, "neogit")

if not present then
  return
end

neogit.setup({
  -- Auto-fetch on open
  disable_commit_confirmation = false,
  auto_refresh = true,
  kind = "tab",  -- Opens in new tab
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true,
    telescope = true,
  },
  -- Use Telescope for branch selection
  use_telescope = true,
  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,
})

-- Auto-fetch when opening Neogit
local neogit_augroup = vim.api.nvim_create_augroup("NeogitCustom", { clear = true })
vim.api.nvim_create_autocmd("User", {
  pattern = "NeogitStatusRefreshed",
  group = neogit_augroup,
  callback = function()
    -- Only fetch if we haven't fetched recently (avoid multiple fetches)
    if not vim.g.neogit_last_fetch or (os.time() - vim.g.neogit_last_fetch > 60) then
      vim.g.neogit_last_fetch = os.time()
      vim.schedule(function()
        vim.notify("Fetching latest changes...", vim.log.levels.INFO)
        vim.fn.system("git fetch --all")
      end)
    end
  end,
})
