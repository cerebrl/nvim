local Util = require("lazyvim.util")

return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, options)
      options.config.center = {
        { action = "Telescope find_files", desc = " Find file", icon = "󰍉 ", key = "f" },
        {
          action = ":lua require('telescope.builtin').oldfiles({cwd = vim.loop.cwd() })",
          desc = " Recent files",
          icon = " ",
          key = "r",
        },
        { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
        { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
        { action = "e $MYVIMRC", desc = " Config", icon = " ", key = "c" },
        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "e" },
        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      }

      for _, button in ipairs(options.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      end

      return options
    end,
  },
}
