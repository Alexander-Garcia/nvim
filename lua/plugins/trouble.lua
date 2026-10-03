return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  config = function(_, opts)
    require("trouble").setup(opts)

    -- jupynvim notebooks are buftype=acwrite, which Trouble's main-window check
    -- rejects, so jumps opened the notebook inside the Trouble split. Accept
    -- windows showing a jupynvim notebook too. Drop this once jupynvim ships
    -- its own compat (draft PR: fix/trouble-jump-target).
    local Main = require("trouble.view.main")
    local orig = Main._valid
    if type(orig) ~= "function" then return end
    Main._valid = function(win, buf)
      if orig(win, buf) then return true end
      if not win or not buf then return false end
      if not vim.api.nvim_win_is_valid(win) or not vim.api.nvim_buf_is_valid(buf) then return false end
      local ok, NB = pcall(require, "jupynvim.notebook")
      if not ok or not NB.get(buf) then return false end
      if vim.api.nvim_win_get_buf(win) ~= buf then return false end
      if vim.w[win].trouble then return false end
      if vim.api.nvim_win_get_config(win).relative ~= "" then return false end
      local pok, Preview = pcall(require, "trouble.view.preview")
      if pok and Preview.is_win and Preview.is_win(win) then return false end
      return true
    end
  end,
  cmd = "Trouble",
  keys = {
    { "<leader>tw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
    { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
    { "<leader>tq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
    { "<leader>tl", "<cmd>Trouble lclist toggle<CR>", desc = "Open trouble location list" },
    { "<leader>tt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
  },
}
