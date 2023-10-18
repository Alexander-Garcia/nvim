return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local cat = require("catppuccin")
        
        cat.setup({
          integrations = {
            indent_blankline = {
              enabled = true,
              colored_indent_levels = false,
            },
          },
        })
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  }
