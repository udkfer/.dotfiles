-- Set the path for the lazy.nvim directory
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

-- Prepend lazypath to the runtimepath
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim and configure plugins
require('lazy').setup({

  { "ellisonleao/gruvbox.nvim" },

  {'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required

      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },

      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required

      {'hrsh7th/cmp-nvim-lsp'}, -- Required

      {'L3MON4D3/LuaSnip'},     -- Required

      {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({})
        end,
      },

      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        end
      },

      {"norcalli/nvim-colorizer.lua"},

      {"nvim-lua/plenary.nvim"},
      {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
      }
    }
  }
})

-- Load additional settings and configurations
require("plugins.settings")
