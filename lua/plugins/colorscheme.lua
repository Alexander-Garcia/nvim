return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local cat = require("catppuccin")

    cat.setup({
      styles = {
        keywords = { "italic" },
      },
      highlight_overrides = { -- wow this took a minute... remove react props in TSX files from being defaulted to italic but keep that color. mauve.. its nice
        all = function()
          return {
            ["@tag.attribute.tsx"] = { fg = "#cba6f7", style = {} },
          }
        end,
      },
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
