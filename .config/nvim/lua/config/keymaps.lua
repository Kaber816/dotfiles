local builtin = require("telescope.builtin")

-----------------------------
--- FUZZY FINDER KEYBINDS ---
-----------------------------

-- Fuzzy find files in the project
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })

-- Live Grep (search inside project using ripgrep)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

-- Search open buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })

-- Search help tags
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

-- Recent files (really useful)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent Files" })

-- Search in current buffer
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Search in Buffer" })

-- Grep only filenames (not contents)
vim.keymap.set("n", "<leader>fd", builtin.git_files, { desc = "Git Files" })

--------------------------
--- NVIM-TREE KEYBINDS ---
--------------------------

-- Open nvim-tree file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-----------------------
--- BARBAR KEYBINDS ---
-----------------------

-- Move between buffers
vim.keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", { desc = "Prev buffer" })

-- Reorder buffers
vim.keymap.set("n", "<S-l>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<S-h>", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })

-- Close buffer
vim.keymap.set("n", "<leader>c", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

-- Go to buffer by number
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>")
end

-- Pin buffer
vim.keymap.set("n", "<leader>p", "<Cmd>BufferPin<CR>", { desc = "Pin buffer" })

-- Close all but current
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close others" })

-----------------------
--- RANDOM KEYBINDS ---
-----------------------

-- Hover info that shows documentation
vim.keymap.set("n", "<leader>d", function()
    vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
end, { desc = "Hover documentation" })

-- Open man page for word under cursor
vim.keymap.set("n", "<leader>m", function()
  local word = vim.fn.expand("<cword>")  -- get word under cursor
  vim.cmd("Man " .. word)                 -- open man page
end, { desc = "Open man page for word under cursor" })

vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float, { desc = "Show diagnostic" })

