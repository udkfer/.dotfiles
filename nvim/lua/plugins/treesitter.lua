local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {all},
      auto_install = true,
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}

return { M }
