return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local cat = require("catppuccin")

    cat.setup({
      flavor = "macchiato",
      styles = {
        keywords = { "italic" },
      },
      highlight_overrides = {
        all = function()
          return {
            ["@tag.attribute.tsx"] = { fg = "#eed49f", style = {} },
            ["@variable.member.tsx"] = { fg = "#cad3f5" },
            ["@variable.member.typescript"] = { fg = "#cad3f5" },
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
    vim.cmd([[colorscheme catppuccin]])
  end,
}
