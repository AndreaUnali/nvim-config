local function sh(s)
  return vim.fn.shellescape(s)
end

vim.keymap.set("n", "<leader>rr", function()
  local src = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local cmd = string.format("gcc -Wall -Wextra -g -o %s %s && %s", sh(out), sh(src), sh(out))
  vim.cmd("write")
  vim.cmd("botright 12new")
  vim.fn.jobstart(cmd, { term = true })
  vim.cmd("startinsert")
end, { buffer = true, desc = "Compila ed esegui" })

vim.opt_local.makeprg = "gcc -Wall -Wextra -g -o %:r %"
vim.keymap.set("n", "<leader>rb", "<cmd>write | silent make | cwindow<cr>",
  { buffer = true, desc = "Compila (errori nel quickfix)" })
