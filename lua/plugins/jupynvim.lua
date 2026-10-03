-- Jupyter notebooks (.ipynb) in Neovim with a Rust kernel backend.
-- Pinned: reviewed at v0.4.5; bump the tag deliberately after re-reviewing.
return {
  "sheng-tse/jupynvim",
  tag = "v0.4.5",
  build = function(plugin)
    local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
    install.run(plugin)
  end,
  config = function()
    require("jupynvim").setup({
      log_level = "info",
      image_renderer = "placeholder",
      auto_venv = true,
      -- <leader>n is NvimTreeToggle, so notebook keys live under <leader>j.
      -- <C-j>/<C-k> stay as window navigation.
      keymaps = {
        run_advance_alt = "<leader>jr",
        run_all = "<leader>jR",
        run_above = "<leader>jA",
        run_below = "<leader>jB",
        add_above = "<leader>ja",
        add_below = "<leader>jb",
        delete_cell = "<leader>jd",
        move_up = "<leader>jk",
        move_down = "<leader>jj",
        to_markdown = "<leader>jm",
        to_code = "<leader>jy",
        pick_kernel = "<leader>jK",
        start_kernel = "<leader>js",
        stop_kernel = "<leader>jS",
        interrupt_kernel = "<leader>ji",
        restart_kernel = "<leader>jx",
        expand_output = "<leader>jo",
        clear_output = "<leader>jc",
        clear_all = "<leader>jC",
        save_image = "<leader>jI",
        delete_image = "<leader>jD",
        refresh = "<leader>jL",
        enter_output_dn = "<leader>j]",
        enter_output_up = "<leader>j[",
      },
    })
  end,
}
