vim.g.mapleader = " "

local maps = {
  i = {
    ["<C-c>"] = "<Esc>",
  },
  n = {
    [":"] = ";",
    [";"] = ":",
    ["<C-n>"] = "<cmd>NvimTreeToggle<cr>",
    ["<leader>e"] = "<cmd>TroubleToggle workspace_diagnostics<cr>",
    -- Uppercase Y will grab entire line
    ["Y"] = "yy",
    -- Natural movement over visual lines
    ["j"] = "gj",
    ["k"] = "gk",
  },
}

for mode, mappings in pairs(maps) do
  for keys, mapping in pairs(mappings) do
    vim.api.nvim_set_keymap(mode, keys, mapping, { noremap = true })
  end
end
