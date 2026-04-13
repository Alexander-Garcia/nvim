return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- New nvim-treesitter v1.0 API: setup only accepts install_dir
    require("nvim-treesitter").setup()

    -- Enable highlighting and indentation for all filetypes via autocmd
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
