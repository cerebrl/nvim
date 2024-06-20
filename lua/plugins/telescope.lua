-- Load telescope and its extensions
local T = require("telescope")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      local fb_actions = T.extensions.file_browser.actions
      local show_all = function(prompt_bufnr)
        fb_actions.toggle_hidden(prompt_bufnr)
        fb_actions.toggle_respect_gitignore(prompt_bufnr)
      end
      -- The below *should* use `extensions` and `file_browser` property to be specific,
      -- but it gets overwritten or something in LazyVim? Using `defaults` for now.
      opts.defaults = {
        mappings = {
          ["n"] = {
            ["."] = show_all,
          },
        },
      }
      return opts
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
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
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
      -- {
      --   "<leader>ss",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = { "Constant" },
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      T.load_extension("file_browser")
    end,
  },
  -- {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   build = "make",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     T.load_extension("fzf")
  --   end,
  -- },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      T.load_extension("project")
    end,
  },
}
