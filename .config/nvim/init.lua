-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins using lazy.nvim
require("config.lazy")
require("lazy").setup("plugins")

-- Configuration files
require("config.keymaps")
require("config.lsp")

-- UI
--vim.cmd.colorscheme("colorscheme")

