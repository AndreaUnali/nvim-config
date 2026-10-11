-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Vai alla Dashboard (Snacks è sempre disponibile in questa configurazione)
vim.keymap.set("n", "<leader>h", function()
  Snacks.dashboard.open()
end, { desc = "Go to Dashboard (Home)" })

-- Insert mode: uscita rapida con jk/jj (senza dover raggiungere Esc)
vim.keymap.set("i", "jk", "<Esc>", { desc = "Esci da Insert mode con jk" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Esci da Insert mode con jj" })

-- Terminale: uscire dalla modalità Insert/Terminal
-- (nei terminali aperti con <leader>ft/<leader>fT/<C-/> Snacks gestisce già
-- un doppio <Esc>; queste mappature coprono anche i terminali aperti con :terminal)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Esci dal terminale" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Esci dal terminale con jk" })

-- Chiude per sempre lo split del terminale (esce dall'Insert mode E chiude la finestra),
-- funziona sia da dentro il terminale sia con il focus già sulla finestra
vim.keymap.set("t", "<C-q>", "<C-\\><C-n><C-w>c", { desc = "Chiudi definitivamente il terminale" })
vim.keymap.set("n", "<C-q>", "<C-w>c", { desc = "Chiudi definitivamente il terminale" })

-- Interruttore rapido codice <-> terminale su <C-t>
-- (alternativa a <C-/>, che su alcuni terminali/tastiere non arriva mai a Neovim):
-- se sei nel terminale lo nasconde, altrimenti lo apre/mette a fuoco.
-- Se il job della shell è morto (es. terminato con exit code != 0, cosa che
-- Snacks non chiude automaticamente), il buffer resta "vivo" ma freezzato:
-- lo rileviamo e lo ricreiamo da zero invece di riaprire un cadavere.
vim.keymap.set({ "n", "t" }, "<C-t>", function()
  local dead_term = Snacks.terminal.get(nil, { cwd = LazyVim.root(), create = false })
  if dead_term and dead_term:buf_valid() then
    local job = vim.b[dead_term.buf].terminal_job_id
    if job and vim.fn.jobwait({ job }, 0)[1] ~= -1 then
      vim.api.nvim_buf_delete(dead_term.buf, { force = true })
    end
  end

  local term = Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
  if term and vim.api.nvim_get_current_buf() == term.buf then
    vim.cmd.startinsert()
  end
end, { desc = "Toggle Terminal" })
