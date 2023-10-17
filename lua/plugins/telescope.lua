return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- they recommend not to use master
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.load_extension("fzf")
    end,
  opts = {
    defaults = {
      file_ignore_patterns = { 'node_modules' },
    }
  },
}
