return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  init = function()
    require("plugins.utils.comp-spinner").setup()
  end,
  opts = {
    strategies = {
      chat = {
        adapter = "claude_code",
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
    -- explain the visual selection in a new chat
    {
      "<leader>ce",
      function()
        vim.cmd("'<,'>CodeCompanionChat Explain this code clearly.")
      end,
      desc = "Explain selection",
      mode = { "v" },
    },
    -- ask about diagnostics on current line
    {
      "<leader>cd",
      function()
        local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
        if #diags == 0 then
          vim.notify("No diagnostics on current line", vim.log.levels.INFO)
          return
        end
        local msg = table.concat(
          vim.tbl_map(function(d)
            return d.message
          end, diags),
          "\n"
        )
        vim.cmd("CodeCompanionChat Explain this error and how to fix it:\n" .. msg)
      end,
      desc = "Explain diagnostics",
      mode = { "n" },
    },
  },
}
