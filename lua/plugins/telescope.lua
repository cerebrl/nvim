return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
          "nvim-telescope/telescope-file-browser.nvim",
        },
      },
    },
    opts = function()
      local T = require("telescope")
      T.load_extension("file_browser")
      T.load_extension("project")
    end,
    keys = {
      -- Change buffer list to dropdown with no previewer
      {
        "<leader>fb",
        "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
        desc = "Buffers (Telescope)",
      },
      {
        "<leader>,",
        "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
        desc = "Buffers (Telescope)",
      },
    },
  },
}
