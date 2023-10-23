-- Load telescope and its extensions
local T = require("telescope")
-- Grab Lazy's Util module
local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          T.load_extension("file_browser")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          T.load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
          "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
          T.load_extension("project")
        end,
      },
    },
    opts = function(_, opts)
      local fb_actions = T.extensions.file_browser.actions
      opts.extensions = {
        file_browser = {
          mappings = {
            ["n"] = {
              ["."] = function(prompt_bufnr)
                fb_actions.toggle_hidden(prompt_bufnr)
                fb_actions.toggle_respect_gitignore(prompt_bufnr)
              end,
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
        mode = { "n" },
      },
      {
        "<leader>,",
        "<cmd>Telescope buffers theme=dropdown previewer=false<cr>",
        desc = "Buffers (Telescope)",
        mode = { "n" },
      },
      -- Flip the `r` and `R` mappings from Lazy's default
      {
        "<leader>fr",
        Util.telescope("oldfiles", { cwd = vim.loop.cwd() }),
        desc = "Recent (within project)",
        mode = { "n" },
      },
      {
        "<leader>fR",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent (cross project)",
        mode = { "n" },
      },
      -- Telescope: modified Git files
      {
        "<leader>fm",
        require("plugins.custom.modified-files").git_diff_picker,
        desc = "Modifed files (Telescope)",
        mode = { "n" },
      },
      {
        "<leader>gm",
        require("plugins.custom.modified-files").git_diff_picker,
        desc = "Modifed files (Telescope)",
        mode = { "n" },
      },
      -- Telescope: directory/file browser
      {
        "<leader>fd",
        ":Telescope file_browser<CR>",
        desc = "Browser root dir (Telescope)",
        noremap = true,
        mode = { "n" },
      },
      {
        "<leader>fD",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Browse cwd (Telescope)",
        noremap = true,
        mode = { "n" },
      },
      -- Telescope: projects
      {
        "<leader>fp",
        ":lua require'telescope'.extensions.project.project{}<CR>",
        desc = "Browse projects (Telescope)",
        noremap = true,
        mode = { "n" },
        silent = true,
      },
      -- Telescope: noice history
      -- https://github.com/folke/noice.nvim/blob/main/doc/noice.nvim.txt#L704
      {
        "<leader>snt",
        ":Noice telescope<CR>",
        desc = "Show message history (Telescope)",
        mode = { "n" },
      },
    },
  },
}
