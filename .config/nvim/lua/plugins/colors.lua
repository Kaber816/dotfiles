return {
    {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,

        opts = {
            transparent_background = true,
            dim_inactive = true,
            show_split_lines = true,
            show_end_of_buffer = false,

            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                includes = { "italic" },
                types = { "italic" },
            },
        },

        config = function(_, opts)
        require("neopywal").setup(opts)
        vim.cmd.colorscheme("neopywal")
        end,
    }
}
