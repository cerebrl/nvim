local Util = require("lazyvim.util")

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
    opts = function(_, opts)
      local fb_actions = require("telescope").extensions.file_browser.actions
      local show_all = function(prompt_bufnr)
        fb_actions.toggle_hidden(prompt_bufnr)
        fb_actions.toggle_respect_gitignore(prompt_bufnr)
      end
      opts.extensions = {
        file_browser = {
          mappings = {
            ["n"] = {
              ["."] = show_all,
            },
          },
        },
      }
    end,
    keys = {
      -- Change buffer list to dropdown with no previewer
      {
        "<leader>fb",
        "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
        desc = "Buffers (Telescope)",
      },
      {
        "<leader>fr",
        Util.telescope("oldfiles", { cwd = vim.loop.cwd() }),
        desc = "Recent (within project)",
      },
      {
        "<leader>fR",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent (cross project)",
      },
      {
        "<leader>,",
        "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
        desc = "Buffers (Telescope)",
      },
    },
  },
}
