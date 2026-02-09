-- colorscheme.lua
-- Dark Transparent + Matcha Accents

vim.cmd("highlight clear")
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.colors_name = "eink_transparent"

-- ---- Color palette ----
local c = {
  fg        = "#C0C0C0",
  fg_dim    = "#9A9A9A",
  fg_muted  = "#7A7A7A",

  bg_alt    = "#2A2A2A",
  border    = "#3A3A3A",

  -- Matcha / plant tones
  matcha_soft = "#7E8B6B", -- tea foam
  matcha_leaf = "#8F9F7B", -- living leaf
  matcha_moss = "#6F7F5F", -- deep moss

  white     = "#D0D0D0",
  cyan      = "#7E7E7E",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ---- Core editor ----
hi("Normal",        { fg = c.fg, bg = "NONE" })
hi("NormalNC",      { fg = c.fg_dim, bg = "NONE" })
hi("EndOfBuffer",   { fg = "#000000", bg = "NONE" })
hi("LineNr",        { fg = c.fg_muted })
hi("CursorLineNr",  { fg = c.fg })
hi("Visual",        { bg = c.bg_alt })
hi("VertSplit",     { fg = c.border })
hi("WinSeparator",  { fg = c.border })
hi("CursorLine",    { bg = "NONE" })
hi("CursorColumn",  { bg = "NONE" })

-- ---- Status / UI ----
hi("StatusLine",    { fg = c.fg, bg = "NONE" })
hi("StatusLineNC",  { fg = c.fg_muted, bg = "NONE" })
hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.white, bg = c.border })
hi("NormalFloat",   { bg = "NONE" })
hi("FloatBorder",   { fg = c.border, bg = "NONE" })

-- ---- Search ----
hi("Search",        { fg = c.white, bg = c.matcha_moss })
hi("IncSearch",     { fg = c.white, bg = c.matcha_leaf })

-- ---- Syntax ----
hi("Comment",       { fg = c.fg_muted, italic = true })
hi("String",        { fg = c.matcha_leaf })
hi("Function",      { fg = c.white })
hi("Identifier",    { fg = c.fg })
hi("Keyword",       { fg = c.fg })
hi("Type",          { fg = c.matcha_soft })
hi("Operator",      { fg = c.fg })
hi("Special",       { fg = c.cyan })

-- ---- Diagnostics ----
hi("DiagnosticError", { fg = c.fg })
hi("DiagnosticWarn",  { fg = c.matcha_soft })
hi("DiagnosticInfo",  { fg = c.cyan })
hi("DiagnosticHint",  { fg = c.fg_muted })

-- ---- Git / Diff ----
hi("DiffAdd",        { fg = c.matcha_leaf, bg = "NONE" })
hi("DiffChange",     { fg = c.matcha_soft, bg = "NONE" })
hi("DiffDelete",     { fg = c.fg_muted, bg = "NONE" })

-- ---- Treesitter links ----
hi("@comment",   { link = "Comment" })
hi("@string",    { link = "String" })
hi("@function",  { link = "Function" })
hi("@type",      { link = "Type" })
hi("@keyword",   { link = "Keyword" })
hi("@operator",  { link = "Operator" })

-- ======================================================
-- Diagnostics visuals (match CMP style)
-- ======================================================

-- undercurls for severity
hi("DiagnosticUnderlineError", { undercurl = true, sp = "#B07A7A" })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.matcha_leaf })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = "#6A7A8A" })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.fg_muted })

-- gutter icons match theme
hi("DiagnosticSignError", { fg = "#B07A7A" })
hi("DiagnosticSignWarn",  { fg = c.matcha_leaf })
hi("DiagnosticSignInfo",  { fg = c.cyan })
hi("DiagnosticSignHint",  { fg = c.fg_muted })

