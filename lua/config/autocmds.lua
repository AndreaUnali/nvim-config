-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Markdown: niente autoformat al salvataggio e nessuna diagnostica invasiva
-- (silenzia tutti gli avvisi di markdownlint/marksman, non solo quelli pignoli)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  group = vim.api.nvim_create_augroup("custom_markdown_quiet", { clear = true }),
  callback = function(ev)
    vim.b.autoformat = false
    vim.diagnostic.enable(false, { bufnr = ev.buf })
  end,
})

-- C/C++: niente autoformat al salvataggio.
-- clangd/clang-format riformattava lo spacing attorno agli operatori a ogni
-- <C-s>, andando in conflitto con lo stile scritto a mano (es. spazio
-- reinserito dopo averlo tolto). Formatta manualmente con <leader>cf quando serve.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  group = vim.api.nvim_create_augroup("custom_c_no_autoformat", { clear = true }),
  callback = function()
    vim.b.autoformat = false
  end,
})
