return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Use smaller x for tabs
        buffer_close_icon = "✕",
        tab_size = 24,
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
          symbol = "",
        },
        name = {
          use_git_status_colors = false,
        },
        git_status = {
          -- A few icons use the old v2 NerdFont assignment, so some show as questionmarks
          -- Replacements that are v3 compatible will be needed.
          symbols = {
            added = "a", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "m", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "d", -- this can only be used in the git_status source
            renamed = "r", -- this can only be used in the git_status source
            -- Status type
            untracked = "u",
            ignored = "i",
            unstaged = "u",
            staged = "s",
            conflict = "c",
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
}
