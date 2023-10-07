-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

-- Bufferline tab goto
vim.api.nvim_set_keymap("n", "<M-1>", "<CMD>BufferLineGoToBuffer 1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-2>", "<CMD>BufferLineGoToBuffer 2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "<CMD>BufferLineGoToBuffer 3<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-4>", "<CMD>BufferLineGoToBuffer 4<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-5>", "<CMD>BufferLineGoToBuffer 5<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-6>", "<CMD>BufferLineGoToBuffer 6<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-7>", "<CMD>BufferLineGoToBuffer 7<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-8>", "<CMD>BufferLineGoToBuffer 8<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<M-9>", "<CMD>BufferLineGoToBuffer 9<CR>", { silent = true })

-- Switch to previous buffer
vim.keymap.set("n", ",,", "<cmd>bp<cr>", { desc = "Lazygit (cwd)" })
