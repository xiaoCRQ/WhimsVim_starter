require("dap-config.c-dap")
-- require("dap-config.html-server")

require("dap-config.keymaps")

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
require("dapui").setup({
  element_mappings = {
    scopes = {
      edit = "e",
      repl = "r",
    },
    watches = {
      edit = "e",
      repl = "r",
    },
    stacks = {
      open = "g",
    },
    breakpoints = {
      open = "g",
      toggle = "b",
    },
  },

  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },

  layouts = {
    {
      elements = {
        "console",
      },
      size = 0.5,
      position = "right",
    },
  },

  -- 👇 以下字段是新版 `nvim-dap-ui` 必须提供的，哪怕你不改，也要给默认值
  icons = { expanded = "▾", collapsed = "▸", current_frame = "⭐" },
  mappings = {
    expand = { "<CR>", "<Tab>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  force_buffers = true,
  controls = {
    enabled = false,
    element = "repl",
    icons = {},
  },
  render = {
    max_type_length = nil,
    max_value_lines = 100,
  },
})
