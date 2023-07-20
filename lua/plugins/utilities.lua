-- mini.nvim plugins
return {
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				-- Use smaller x for tabs
				buffer_close_icon = "✕",
				tab_size = 24,
			},
		},
	},
	{
		-- This needs to be imported from LazyVim as an extra plugin
		"echasnovski/mini.hipatterns",
		enabled = false,
	},
	{
		-- This needs to be imported from LazyVim as an extra plugin
		"echasnovski/mini.animate",
		enabled = false,
	},
	{
		"echasnovski/mini.move",
		version = false,
		enabled = true,
	},
	{ "folke/todo-comments.nvim", enabled = true },
	{ "folke/trouble.nvim", enabled = true },
	{ "lewis6991/gitsigns.nvim", enabled = true },
	{
		"nvim-neo-tree/neo-tree.nvim",
		-- https://github.com/nvim-neo-tree/neo-tree.nvim#longer-example-for-packer
		opts = {
			-- Would rather use a dedicated Git utility, rather than neotree
			enable_git_status = false,
			default_component_configs = {
				icons = {},
				git_status = {
					-- A few icons use the old v2 NerdFont assignment, so some show as questionmarks
					-- Replacements that are v3 compatible will be needed.
					symbols = {},
				},
			},
		},
	},
}
