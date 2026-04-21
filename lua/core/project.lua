local M = {}

M.js_filetypes = {
  javascript = true,
  typescript = true,
  javascriptreact = true,
  typescriptreact = true,
  vue = true,
}

function M.has_biome_config(bufnr)
  return vim.fs.find({ "biome.json", "biome.jsonc" }, {
    upward = true,
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr or 0)),
  })[1] ~= nil
end

function M.get_formatter(bufnr)
  return M.has_biome_config(bufnr) and { "biome" } or { "prettier" }
end

-- In Biome projects the Biome LSP handles linting and nvim-lint is skipped,
-- so report { "biome" } for display purposes.
function M.get_linters(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  if M.js_filetypes[ft] and M.has_biome_config(bufnr) then
    return { "biome" }
  end
  return require("lint").linters_by_ft[ft]
end

return M
