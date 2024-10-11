return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- stolen shamelessly from evil lualine
    local lsp_server_name = {
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = "  LSP:",
      color = { fg = "#c678dd", gui = "bold" },
      padding = 2,
    }

    lualine.setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_x = {
          {
            "copilot",
            show_colors = true,
          },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
            padding = 1,
          },
          lsp_server_name,
          { "encoding" },
          { "fileformat" },
          { "filetype",  padding = 1 },
        },
      },
    })
  end,
}
