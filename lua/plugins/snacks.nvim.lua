return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "l", desc = "LeetCode", action = ":Leet" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
 ██╗  ██╗██╗ █████╗  ██████╗  ██████╗██████╗  ██████╗
 ╚██╗██╔╝██║██╔══██╗██╔═══██╗██╔════╝██╔══██╗██╔═══██╗
  ╚███╔╝ ██║███████║██║   ██║██║     ██████╔╝██║   ██║
  ██╔██╗ ██║██╔══██║██║   ██║██║     ██╔══██╗██║▄▄ ██║
 ██╔╝ ██╗██║██║  ██║╚██████╔╝╚██████╗██║  ██║╚██████╔╝
 ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝ ╚══██═╝]],
      },

      sections = {
        {
          section = "terminal",
          cmd = "chafa -c full --fg-only --symbols solid --align=mid "
            .. vim.fn.stdpath("config")
            .. "/lua/logo/v-3.gif",
          height = 18,
          padding = 1,
        },
        {
          pane = 2,
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
