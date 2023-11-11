return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      day_brightness = 0.2,
      on_colors = function(colors)
        -- Adjusted for deeper blacks/backgrounds
        -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua

        -- Core colors
        colors.black = "#000000"
        colors.almost_black = "#0D1117"
        colors.very_dark_gray = "#16161E"

        -- Backgrounds
        colors.bg = colors.black
        colors.bg_dark = colors.black
        colors.bg_float = colors.very_dark_gray
        colors.bg_highlight = "#1A1B26"
        colors.bg_popup = colors.very_dark_gray
        colors.bg_search = "#292042"
        colors.bg_sidebar = colors.black
        colors.bg_statusline = colors.black
        colors.bg_visual = "#1d2640"
      end,
    },
  },
}
