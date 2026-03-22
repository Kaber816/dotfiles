return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",       -- git indicators
      "nvim-tree/nvim-web-devicons",   -- icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,
      tabpages = true,
      focus_on_close = "left",

      hide = {
        extensions = true,   -- hide file extensions
        inactive = false,
      },

      clickable = true,

      icons = {
        buffer_index = true,
        buffer_number = false,
        button = "",
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ""},
          [vim.diagnostic.severity.WARN]  = {enabled = true, icon = ""},
          [vim.diagnostic.severity.INFO]  = {enabled = false},
          [vim.diagnostic.severity.HINT]  = {enabled = true},
        },
        gitsigns = {
          added = {enabled = true, icon = "+"},
          changed = {enabled = true, icon = "~"},
          deleted = {enabled = true, icon = "-"},
        },
        separator = {left = "▎", right = ""},
        modified = {button = "●"},
        pinned = {button = "車", filename = true},
      },

      sidebar_filetypes = {
        NvimTree = true,  -- 👈 THIS is the important part
      },
    },

    version = "^1.0.0",
  },
}
