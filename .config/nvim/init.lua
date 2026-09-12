---------------------------------------------------------
-- TO USE THIS CONFIG YOU NEED THE FOLLOWING DEPENDENCIES
---------------------------------------------------------
-- ripgrep (for telescope grep)
-- tree-sitter cli (for highlighting)
-- :TSInstall clangd
-- mason (for lsp)
-- :MasonInstall Clangd
-- xlip (for system-level copy-paste)

---------------------------------------------------------
-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set clipboard to enable system-level copy-paste
vim.opt.clipboard = 'unnamedplus'

-- Set termgui colors
vim.opt.termguicolors = true

-- Load plugins using lazy.nvim
require("config.lazy")

-- Configuration files
require("config.keymaps")
require("config.lsp")

-- UI
--vim.cmd.colorscheme("colorscheme")

