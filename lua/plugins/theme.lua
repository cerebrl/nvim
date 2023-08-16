return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      on_colors = function(colors)
        -- Adjusted for deeper blacks/backgrounds
        -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

        -- Core colors
        colors.black = "#000000"

        -- Backgrounds
        colors.bg = "#16161E"
        colors.bg_dark = "#0D1117"
        colors.bg_float = colors.bg_dark
        colors.bg_highlight = "#1A1B26"
        colors.bg_popup = colors.bg_dark
        colors.bg_search = "#292042"
        colors.bg_sidebar = colors.bg_dark
        colors.bg_statusline = colors.bg_dark
        colors.bg_visual = "#1d2640"

        -- Text
        colors.comment = "#6f7386"
      end,
      on_highlights = function(hl, c)
        -- Fix color and remove italics on the Git icons
        -- Not declaring `italic` withing object resets to normal
        hl.NeoTreeGitConflict = { fg = c.fg_dark }
        hl.NeoTreeGitIgnored = { fg = c.fg_dark }
        hl.NeoTreeGitStaged = { fg = c.fg_dark }
        hl.NeoTreeGitUnstaged = { fg = c.fg_dark }
        hl.NeoTreeGitUntracked = { fg = c.fg_dark }
      end,
    },
  },
}
