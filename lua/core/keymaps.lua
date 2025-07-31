vim.g.mapleader = " "

local maps = {
  i = {
    ["<C-c>"] = "<Esc>",
  },
  n = {
    [":"] = ";",
    [";"] = ":",
    -- Uppercase Y will grab entire line
    ["Y"] = "yy",
    -- Natural movement over visual lines
    ["j"] = "gj",
    ["k"] = "gk",
    ["<C-h>"] = "<C-w>h", -- move to left window
    ["<C-j>"] = "<C-w>j", -- move to down window
    ["<C-k>"] = "<C-w>k", -- move to up window
    ["<C-l>"] = "<C-w>l", -- move to right window
  },
}

for mode, mappings in pairs(maps) do
  for keys, mapping in pairs(mappings) do
    vim.api.nvim_set_keymap(mode, keys, mapping, { noremap = true })
  end
end
