return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- niente testo fantasma sovrapposto a quello che stai scrivendo
        ghost_text = { enabled = false },
        menu = {
          -- il menu si apre da solo, ma appare sotto la riga corrente
          -- quindi non copre quello che stai scrivendo
          auto_show = true,
          border = "rounded",
        },
        -- niente popup di documentazione automatico: si apre solo a comando (<C-space>)
        documentation = {
          auto_show = false,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
      keymap = {
        -- come VSCode/Copilot: Tab conferma il suggerimento selezionato,
        -- ma le frecce e Invio restano sempre liberi per muoversi/andare a capo
        preset = "super-tab",
        ["<Up>"] = { "fallback" },
        ["<Down>"] = { "fallback" },
      },
    },
  },
}
