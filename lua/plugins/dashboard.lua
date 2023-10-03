local Util = require("lazyvim.util")

return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function(_, dashboard)
      -- Customize buttons on dashboard
      dashboard.section.buttons.val = {
        dashboard.button("p", " " .. " Projects", ":lua require'telescope'.extensions.project.project{}<CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button(
          "r",
          " " .. " Recent files",
          ":lua require('telescope.builtin').oldfiles({cwd = vim.loop.cwd() })<CR>"
        ),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      return dashboard
    end,
  },
}
