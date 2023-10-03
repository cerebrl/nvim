return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Always show tabs, even if there's just one open
        -- This helps with the unsaved changes "dot" visual in the tab
        always_show_bufferline = true,
        -- Use smaller x for tabs
        buffer_close_icon = "✕",
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        style_preset = require("bufferline").style_preset.no_italic,
      },
    },
  },
  {
    -- Disabling as I never notice this or use it
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      default_component_configs = {
        modified = {
          -- This is a redundant symbol to the git status modified symbol below
          symbol = "",
        },
        name = {
          -- I like a more uniform color in the file tree
          use_git_status_colors = false,
        },
        git_status = {
          -- A few icons use the old v2 NerdFont assignment, so some show as questionmarks
          -- Below are replacements that are v3 compatible
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "r",

            -- Status type
            untracked = "",
            ignored = "󰈉",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
}
