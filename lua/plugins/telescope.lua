return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
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
  },
}
