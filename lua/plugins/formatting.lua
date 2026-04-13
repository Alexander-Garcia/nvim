return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local function has_biome_config(bufnr)
      return vim.fs.find({ "biome.json", "biome.jsonc" }, {
        upward = true,
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
      })[1] ~= nil
    end

    conform.setup({
      formatters_by_ft = {
        yaml = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = function(bufnr)
          return has_biome_config(bufnr) and { "biome" } or { "prettier " }
        end,
        css = { "prettier" },
        json = { "prettier" },
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
