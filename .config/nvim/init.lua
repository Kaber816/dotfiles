-- Load plugins using lazy.nvim
require("config.lazy")
require("lazy").setup("plugins")

-- Configuration files
require("config.keymaps")
require("config.lsp")

-- UI
--vim.cmd.colorscheme("colorscheme")

