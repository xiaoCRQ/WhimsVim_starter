-- 导入调试器用户界面库
local dapui = require("dapui")

-- 插件默认

-- 配置调试器用户界面
dapui.setup({
  layouts = {
    {
      elements = {
        "scopes",
        "stacks",
        "breakpoints",
        "watches",
      },
      size = 0.2, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
    {
      elements = {
        "console",
      },
      size = 0.2,
      position = "right",
    },
  },
})
