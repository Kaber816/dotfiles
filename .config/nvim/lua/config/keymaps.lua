local builtin = require("telescope.builtin")

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

