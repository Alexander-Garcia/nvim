-- TODO: handle conflic of LSP / formatters i.e., lua_ls provides formatting as well as stylua. Choose null_ls
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    null_ls.setup({
      sources = {
        formatting.stylua.with({
          indent_type = { "Spaces" },
        }),
        formatting.prettierd,
        formatting.black,
      },
    })

    vim.keymap.set("n", "<leader>fo", function()
      vim.lsp.buf.format({
        timeout_ms = 2000,
        filter = function(client)
          return client.name == "null-ls"
        end,
      })
    end, {})
  end,
}
