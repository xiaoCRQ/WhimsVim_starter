-- 导入调试器用户界面库
local dapui = require("dapui")

-- 默认
-- 控制台 右50%

-- 配置调试器用户界面
dapui.setup({
  layouts = { -- 布局
    {
      elements = {
        "console", -- 控制台
      },
      size = 0.6,
      position = "right", -- 位置：右侧
    },
  },
})
