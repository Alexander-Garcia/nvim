return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "openai",
        model = "gpt-4o",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      chat = {
        auto_scroll = false,
        window = {
          position = "right",
        },
      },
    },
  },
}
