vim.g.mapleader = ","

local maps = {
  i = {
    ['<C-c>'] = '<Esc>',
  },
  n = {
    [':'] = ';',
    [';'] = ':',
    ['<C-n>'] = '<cmd>NvimTreeToggle<cr>',
    ['<leader>ff'] = '<cmd>Telescope find_files<cr>',
    ['<leader>D'] = '<cmd>lua vim.lsp.buf.type_definition()<cr>',
    ['<leader>a'] = '<cmd>Telescope live_grep<cr>',
    ['<leader>b'] = '<cmd>Telescope buffers<cr>',
    ['<leader>e'] = '<cmd>TroubleToggle workspace_diagnostics<cr>',
    ['<leader>fo'] = '<cmd>lua vim.lsp.buf.format { async = true }<cr>',
    ['<leader>gd'] = '<cmd>Gdiff<cr>',
    ['<leader>gs'] = '<cmd>Gstatus<cr>',
    ['<leader>rn'] = '<cmd>lua vim.lsp.buf.rename()<cr>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<cr>',
    -- Uppercase Y will grab entire line
    ['Y'] = 'yy',
    ['[d'] = '<cmd>lua vim.lsp.buf.goto_prev()<cr>',
    [']d'] = '<cmd>lua vim.lsp.buf.goto_next()<cr>',
    ['gD'] = '<cmd>lua vim.lsp.buf.declaration()<cr>',
    ['gd'] = '<cmd>lua vim.lsp.buf.definition()<cr>',
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<cr>',
    ['gr'] = '<cmd>lua vim.lsp.buf.references()<cr>',
    -- Natural movement over visual lines
    ['j'] = 'gj',
    ['k'] = 'gk',
  },
}

for mode, mappings in pairs(maps) do
  for keys, mapping in pairs(mappings) do
    vim.api.nvim_set_keymap(mode, keys, mapping, { noremap = true })
  end
end
