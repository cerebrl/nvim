return {
  {
    "gbprod/yanky.nvim",
    keys = {
      {
        "<leader>p",
        function()
          local opts = require("telescope.themes").get_dropdown({ previewer = false })
          require("telescope").extensions.yank_history.yank_history(opts)
        end,
        desc = "Open Yank History (Telescope)",
      },
    },
  },
}
