-- Initialize LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Load LazyVim and setup plugins
require("lazy").setup({
  spec = {
    -- add LazyVim's default plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = function(_, options)
        -- Reuse symbol types from LazyVim
        -- Alter for better TypeScript/JavaScript support
        options.kind_filter = require("lazyvim.config").kind_filter

        -- Add constants to the list for default
        table.insert(options.kind_filter.default, "Constant")

        -- Iterate over the list and remove properties from list
        -- http://www.lua.org/manual/5.1/manual.html#pdf-ipairs
        for idx, val in ipairs(options.kind_filter.default) do
          if "Property" == val then
            table.remove(options.kind_filter.default, idx)
          end
        end
        return options
      end,
    },

    -- add LazyVim's extra plugins
    { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- add symbols-outline plugins here

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
  },
})
