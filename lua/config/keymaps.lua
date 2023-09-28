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

-- Change Lazygit to full screen
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, {
    cwd = Util.get_root(),
    esc_esc = false,
    ctrl_hjkl = false,
    size = { height = 1, width = 1 },
  })
end, { desc = "Lazygit (root dir)" })

vim.keymap.set("n", "<leader>gG", function()
  Util.float_term({ "lazygit" }, {
    esc_esc = false,
    ctrl_hjkl = false,
    size = { height = 1, width = 1 },
  })
end, { desc = "Lazygit (cwd)" })

-- Telescope: modified files
vim.keymap.set(
  "n",
  "<leader>gm",
  require("plugins.custom.modified-files").git_diff_picker,
  { desc = "Modifed files (Telescope)" }
)

-- Telescope: directory/file browser
vim.api.nvim_set_keymap(
  "n",
  "<leader>fd",
  ":Telescope file_browser<CR>",
  { desc = "Browser root dir (Telescope)", noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fD",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { desc = "Browse cwd (Telescope)", noremap = true }
)

-- Telescope: projects
vim.api.nvim_set_keymap(
  "n",
  "<leader>fp",
  ":lua require'telescope'.extensions.project.project{}<CR>",
  { desc = "Browse projects (Telescope)", noremap = true, silent = true }
)

-- Telescope: noice history
-- https://github.com/folke/noice.nvim/blob/main/doc/noice.nvim.txt#L704
vim.api.nvim_set_keymap("n", "<leader>snt", ":Noice telescope<CR>", { desc = "Show message history (Telescope)" })
