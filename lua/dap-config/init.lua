require("dap-config.c-dap")
-- require("dap-config.html-server")

require("dap-config.keymaps")
-- 导入调试器库
local dap = require("dap")
-- 导入调试器用户界面库
local dapui = require("dapui")

-- 配置虚拟文本显示的一些选项
require("nvim-dap-virtual-text").setup({
  enabled = true, -- 启用虚拟文本显示
  enable_commands = true, -- 启用虚拟文本命令
  highlight_changed_variables = true, -- 高亮更改的变量
  highlight_new_as_changed = false, -- 将新变量视为更改
  show_stop_reason = true, -- 显示停止原因
  commented = false, -- 是否为已注释的代码
  only_first_definition = true, -- 仅显示第一个定义
  all_references = false, -- 显示所有引用
  filter_references_pattern = "<module", -- 过滤引用的模式
  virt_text_pos = "eol", -- 虚拟文本位置：行尾
  all_frames = false, -- 显示所有帧
  virt_lines = false, -- 虚拟行
  virt_text_win_col = nil, -- 虚拟文本窗口列
})

-- 设置调试器断点的高亮
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0 })

-- 配置调试器用户界面
dapui.setup({
  element_mappings = {
    scopes = { -- 作用域
      edit = "e", -- 编辑
      repl = "r", -- REPL
    },
    watches = { -- 观察
      edit = "e",
      repl = "r",
    },
    stacks = { -- 堆栈
      open = "g", -- 打开
    },
    breakpoints = { -- 断点
      open = "g",
      toggle = "b", -- 切换
    },
  },
  floating = { -- 浮动窗口
    max_height = nil, -- 最大高度
    max_width = nil, -- 最大宽度
    border = "rounded", -- 边框样式：圆角
    mappings = {
      close = { "q", "<Esc>" }, -- 关闭操作的快捷键
    },
  },
})

-- 在调试器事件初始化后打开调试器用户界面
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- 在调试器事件终止前关闭调试器用户界面
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

-- 在调试器事件退出前关闭调试器用户界面
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("windows.no1")
