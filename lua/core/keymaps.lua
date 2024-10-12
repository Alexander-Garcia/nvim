vim.g.mapleader = ","

local maps = {
  i = {
    ["<C-c>"] = "<Esc>",
  },
  n = {
    [":"] = ";",
    [";"] = ":",
    ["<C-n>"] = "<cmd>NvimTreeToggle<cr>",
    ["<leader>ff"] = "<cmd>Telescope find_files<cr>",
    ["<leader>a"] = "<cmd>Telescope live_grep<cr>",
    ["<leader>b"] = "<cmd>Telescope buffers<cr>",
    ["<leader>e"] = "<cmd>TroubleToggle workspace_diagnostics<cr>",
    ["<leader>gd"] = "<cmd>Gdiff<cr>",
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
