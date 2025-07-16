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
    local telescopeConfig = require("telescope.config")
    telescope.load_extension("fzf")
    -- for integration with todo-comments
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Search files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep search" })
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- all grep arguments are for live_grep
    -- Add arguments for ignoring certain patterns in text search
    -- access hidden files like .env
    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--no-ignore-vcs")
    table.insert(vimgrep_arguments, "-g")
    table.insert(vimgrep_arguments, "!package-lock.json")
    table.insert(vimgrep_arguments, "-g")
    table.insert(vimgrep_arguments, "!**/node_modules/*")
    table.insert(vimgrep_arguments, "-g")
    table.insert(vimgrep_arguments, "!**/.git/*")
    table.insert(vimgrep_arguments, "-g")
    table.insert(vimgrep_arguments, "!**/.nx/cache/*")

    telescope.setup({
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- Use ripgrep to find files, ignoring certain patterns
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore-vcs",
            "-g",
            "!**/node_modules/*",
            "-g",
            "!**/.git/*",
            "-g",
            "!package-lock.json",
            "-g",
            "!yarn.lock",
            "-g",
            "!pnpm-lock.yaml",
            "-g",
            "!lazy-lock.json",
            "-g",
            "!**/.nx/cache/*",
          },
        },
      },
    })
  end,
}
