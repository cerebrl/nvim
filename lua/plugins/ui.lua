return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Always show tabs, even if there's just one open
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
    "nvim-neo-tree/neo-tree.nvim",
    -- https://github.com/nvim-neo-tree/neo-tree.nvim#longer-example-for-packer
    opts = {
      -- Would rather use a dedicated Git utility, rather than neotree
      enable_git_status = true,
      default_component_configs = {
        icons = {},
        modified = {
          symbol = "",
        },
        name = {
          use_git_status_colors = false,
        },
        git_status = {
          -- A few icons use the old v2 NerdFont assignment, so some show as questionmarks
          -- Replacements that are v3 compatible will be needed.
          symbols = {
            added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "r", -- this can only be used in the git_status source
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
