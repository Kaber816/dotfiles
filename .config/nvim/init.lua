-- Load plugins using lazy.nvim
require("config.lazy")
require("lazy").setup("plugins")
require("config.keymaps")

-- LSP
vim.lsp.enable({ "lua_ls", "clangd" })

