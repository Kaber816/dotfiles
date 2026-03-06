return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },

  config = function()
    local cmp = require("cmp")

    ---------------------------------------------------------------------------
    -- Insert mode completion
    ---------------------------------------------------------------------------
    cmp.setup({
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
        keyword_length = 2,
        completeopt = "menu,menuone,noinsert",
      },

      -----------------------------------------------------------------------
      -- Completion & documentation windows
      -----------------------------------------------------------------------
      window = {
        completion = {
          border = "none",
        },
        documentation = {
          border = "single",
          max_width = 60,
          max_height = 15,
        },
      },

      -----------------------------------------------------------------------
      -- Key mappings
      -----------------------------------------------------------------------
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      }),

      -----------------------------------------------------------------------
      -- Completion sources
      -----------------------------------------------------------------------
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp", priority = 1000 },
          { name = "path", priority = 500 },
        },
        {
          {
            name = "buffer",
            priority = 100,
            keyword_length = 4,
            max_item_count = 5,
          },
        }
      ),

      -----------------------------------------------------------------------
      -- Sorting
      -----------------------------------------------------------------------
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

      -----------------------------------------------------------------------
      -- Limit noise
      -----------------------------------------------------------------------
      max_view_entries = 15,

      -----------------------------------------------------------------------
      -- Ghost text (VSCode-like)
      -----------------------------------------------------------------------
      experimental = {
        ghost_text = true,
      },
    })

    ---------------------------------------------------------------------------
    -- Search completion (/ and ?)
    ---------------------------------------------------------------------------
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    ---------------------------------------------------------------------------
    -- Command completion (:)
    ---------------------------------------------------------------------------
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
