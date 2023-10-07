return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- Use prettier, rather than prettierd, to avoid the file trancation bug:
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/1609
      ensure_installed = { "prettier" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- ensure_installed = { "svelte" },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- Don't use LazyVim's prettier extra plugin as it uses prettierd,
      -- which causes file trancation bug:
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/1609
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      -- The below is to ensure eslint and eslint prettier plugin don't collide
      -- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting
      servers = {
        eslint = {
          -- Simplify root_patterns as it changes root_dir in monorepos with default config
          root_dir = require("lspconfig").util.root_pattern(".git"),
        },
        tailwindcss = {
          -- Simplify root_patterns as it changes root_dir in monorepos with default config
          root_dir = require("lspconfig").util.root_pattern(
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            -- Or, just fallback to `.git`
            ".git"
          ),
        },
        tsserver = {
          root_dir = require("lspconfig").util.root_pattern(".git"),
        },
      },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
