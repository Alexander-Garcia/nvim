return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufNewFile", "BufReadPre" },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = "all",
      ignore_install = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
