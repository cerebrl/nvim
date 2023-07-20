if vim.g.vscode then
	-- vscode
	require("config.vscode")
else
	-- bootstrap lazy.nvim, LazyVim and your plugins
	require("config.lazy")
end
