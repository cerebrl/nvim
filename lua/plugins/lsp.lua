return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- If you want these languages automatically installed
			-- ensure_installed = { "stylua", "svelte", "tailwindcss" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				virtual_text = false,
			},
			-- The below is to ensure eslint and eslint prettier plugin don't collide
			-- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting
			servers = { eslint = {} },
			setup = {
				eslint = function()
					require("lazyvim.util").on_attach(function(client)
						if client.name == "eslint" then
							client.server_capabilities.documentFormattingProvider = true
						elseif client.name == "tsserver" then
							client.server_capabilities.documentFormattingProvider = false
						end
					end)
				end,
			},
		},
	},
}
