-- Load plugins using lazy.nvim
require("config.lazy")
require("lazy").setup("plugins")
require("config.keymaps")

vim.cmd.colorscheme("colorscheme")

-- LSP
vim.lsp.enable({ "lua_ls", "clangd", "pylsp" })

