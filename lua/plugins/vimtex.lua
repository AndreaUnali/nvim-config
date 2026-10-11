return {
  "lervag/vimtex",
  init = function()
    vim.g.vimtex_version_check = 0
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_quickfix_mode = 0
  end,
}
