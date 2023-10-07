return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- Always show tabs, even if there's just one open
        -- This helps with the showing status, like unsaved changes or LSP info
        -- even with only one file open
        always_show_bufferline = true,
        -- Use smaller x for buffer tabs
        buffer_close_icon = "✕",
        -- Removes file type icons
        show_buffer_icons = false,
        -- Remove colored line showing current buffer
        indicator = { style = "none" },
        -- Show buffer list number for quick selection
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
    -- Disabling as I use `telescope-file-browser` instead
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
