return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- they recommend not to use master
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.load_extension("fzf")
    -- for integration with todo-comments
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
  opts = {
    -- just install ripgrep so telescope will automatically use it and ignore .gitignore dirs
    defaults = {
      file_ignore_patterns = { "node_modules", "%.js" },
    },
  },
}
