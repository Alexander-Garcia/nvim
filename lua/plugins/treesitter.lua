return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufNewFile", "BufReadPre" },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      auto_install = true,
      ensure_installed = "all",
      ignore_install = { "ipkg" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
