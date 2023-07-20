local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- TODO: testing
require("lazy").setup({
	{ 'echasnovski/mini.basics', version = false },
	{ "echasnovski/mini.comment", version = false },
	{ 'echasnovski/mini.cursorword', version = false },
	{ "echasnovski/mini.move", version = false },
	{ 'echasnovski/mini.splitjoin', version = false },
	{ "echasnovski/mini.surround", version = false },
})

require("mini.basics").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.move").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
