return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,

            contrast = "soft", -- "soft", "medium", "hard"

            dim_inactive = false,
            transparent_mode = false, -- set true if you want transparent background
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}

--return {
--    {
--        "RedsXDD/neopywal.nvim",
--        name = "neopywal",
--        lazy = false,
--        priority = 1000,
--
--        opts = {
--            transparent_background = true,
--            dim_inactive = true,
--            show_split_lines = true,
--            show_end_of_buffer = false,
--
--            styles = {
--                comments = { "italic" },
--                conditionals = { "italic" },
--                includes = { "italic" },
--                types = { "italic" },
--            },
--        },
--
--        config = function(_, opts)
--        require("neopywal").setup(opts)
--        vim.cmd.colorscheme("neopywal")
--        end,
--    }
--}
