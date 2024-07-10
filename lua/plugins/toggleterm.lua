return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = { { "<F9>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
    opts = {
      shell = "powershell.exe",
      open_mapping = [[<F9>]],
      direction = "float",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      term_mappings = true, -- 启用终端中的键位映射
    },
    on_open = function()
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
