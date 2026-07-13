return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
        auto_install = true,
      })
    end,
  },
}
