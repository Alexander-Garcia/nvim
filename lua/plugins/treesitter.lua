return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- New nvim-treesitter v1.0 API: setup only accepts install_dir.
    -- Passing it is required so the dir gets prepended to runtimepath —
    -- otherwise parsers installed there aren't discovered under lazy.nvim.
    require("nvim-treesitter").setup({
      install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
    })

    -- Enable highlighting and indentation for all filetypes via autocmd
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
