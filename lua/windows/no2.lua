-- 导入调试器用户界面库
local dapui = require("dapui")

-- 控制台 右30%
-- 三元素 下30%

-- 配置调试器用户界面
dapui.setup({
  layouts = { -- 布局
    {
      elements = {
        "console", -- 控制台
      },
      size = 0.3,
      position = "right", -- 位置：右侧
    },
    {
      elements = { -- 元素
        "watches", -- 观察
        "scopes", -- 作用域
        "breakpoints", -- 断点
      },
      size = 0.3,
      position = "bottom", -- 位置：底部
    },
  },
})
