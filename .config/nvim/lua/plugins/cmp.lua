return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = function()
    local cmp = require("cmp")

    return {
      ---------------------------------------------------------------------------
      -- Completion behavior (VS Code–like)
      ---------------------------------------------------------------------------
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
        keyword_length = 2,
        completeopt = "menu,menuone,noinsert",
      },

      ---------------------------------------------------------------------------
      -- Completion & documentation windows
      ---------------------------------------------------------------------------
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
          max_width = 60,
          max_height = 15,
        },
      },

      ---------------------------------------------------------------------------
      -- Key mappings
      ---------------------------------------------------------------------------
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      }),

      ---------------------------------------------------------------------------
      -- Completion sources (ordered & weighted)
      ---------------------------------------------------------------------------
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

      ---------------------------------------------------------------------------
      -- Sorting (strongly VS Code–like)
      ---------------------------------------------------------------------------
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

      ---------------------------------------------------------------------------
      -- Limit noise
      ---------------------------------------------------------------------------
      max_view_entries = 15,

      ---------------------------------------------------------------------------
      -- Inline ghost text (like VS Code)
      ---------------------------------------------------------------------------
      experimental = {
        ghost_text = true,
      },
    }
  end,
}

