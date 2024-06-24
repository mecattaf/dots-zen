local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "│", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsTopdelete", text = "│", numhl = "GitSignsTopdeleteNr" },
    changedelete = { hl = "GitSignsChangedelete", text = "│", numhl = "GitSignsChangedeleteNr" },
    untracked = { hl = "GitSignsUntracked", text = "│", numhl = "GitSignsUntrackedNr" },
  },
}
