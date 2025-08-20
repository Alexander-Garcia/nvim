return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    "ravitemer/mcphub.nvim",
  },
  init = function()
    require("plugins.utils.comp-spinner").setup()
  end,
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
        tools = {
          opts = {
            wait_timeout = 60000,
          },
        },
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      chat = {
        auto_scroll = true,
        window = {
          position = "right",
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
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
    {
      "<leader>ci",
      function()
        vim.ui.input({ prompt = "Prompt: " }, function(prompt)
          if prompt and prompt ~= "" then
            vim.cmd("'<,'>CodeCompanion " .. prompt)
          end
        end)
      end,
      desc = "Inline code edits",
      mode = { "v" },
    },
  },
}
