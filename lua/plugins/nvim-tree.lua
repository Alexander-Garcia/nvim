return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 50,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder_arrow = true,
            folder = true,
            git = false,
          },
        },
        special_files = {
          "Makefile",
          "Cargo.toml",
          "README.md",
          "readme.md",
        },
      },
    })
  end,
}
