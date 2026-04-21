return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local project = require("core.project")
    local get_formatter = project.get_formatter

    conform.setup({
      formatters_by_ft = {
        yaml = { "prettier" },
        javascript = { "prettier" },
        typescript = get_formatter,
        javascriptreact = get_formatter,
        typescriptreact = get_formatter,
        vue = get_formatter,
        css = { "prettier" },
        json = get_formatter,
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fo", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
