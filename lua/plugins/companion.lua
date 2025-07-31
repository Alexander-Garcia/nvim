return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
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
  keys = {
    {
      "<leader>cp",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Open action palette",
      mode = { "n", "v" },
    },
    {
      "<leader>ct",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle le chat buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat<CR>",
      desc = "Open le chat buffer",
      mode = { "n", "v" },
    },
    {
      "<leader>ca",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "Add code to chat buffer",
      mode = { "v" },
    },
  },
}
