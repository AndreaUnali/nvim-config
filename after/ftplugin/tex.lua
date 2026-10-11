local function snippet(lines, target_line, target_col)
  local function insert()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row, row, false, lines)
    vim.api.nvim_win_set_cursor(0, { row + target_line, target_col })
    vim.cmd("startinsert!")
  end
  return insert
end

local function map(lhs, lines, target_line, target_col, desc)
  vim.keymap.set("n", lhs, snippet(lines, target_line, target_col),
    { buffer = true, desc = desc })
end

map("<leader>xi", {
  "\\begin{itemize}",
  "  \\item ",
  "\\end{itemize}",
}, 2, 8, "Elenco puntato")

map("<leader>xn", {
  "\\begin{enumerate}",
  "  \\item ",
  "\\end{enumerate}",
}, 2, 8, "Elenco numerato")

map("<leader>xt", {
  "\\begin{table}[h]",
  "  \\centering",
  "  \\rowcolors{2}{white}{mainorange!8}",
  "  \\begin{tabular}{l c c}",
  "    \\arrayrulecolor{mainorange}\\toprule",
  "    \\rowcolor{mainorange}",
  "    \\textcolor{white}{\\textbf{A}} & \\textcolor{white}{\\textbf{B}} & \\textcolor{white}{\\textbf{C}} \\\\",
  "    \\arrayrulecolor{mainorange}\\midrule",
  "    1 & 2 & 3 \\\\",
  "    \\arrayrulecolor{mainorange}\\bottomrule",
  "  \\end{tabular}",
  "  \\caption{Didascalia}",
  "  \\label{tab:label}",
  "\\end{table}",
}, 6, 6, "Tabella")

map("<leader>xp", {
  "\\begin{figure}[h]",
  "  \\centering",
  "  \\includegraphics[width=0.8\\textwidth]{nome-immagine}",
  "  \\caption{Didascalia}",
  "  \\label{fig:label}",
  "\\end{figure}",
}, 3, 15, "Immagine")

map("<leader>xb", {
  "\\begin{notebox}",
  "  ",
  "\\end{notebox}",
}, 2, 2, "Nota (box personalizzato)")
