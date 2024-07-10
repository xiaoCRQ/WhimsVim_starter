-- 插件快捷键
local map = vim.api.nvim_set_keymap -- 创建键盘映射的函数
local opt = { -- 选项表，用于指定键盘映射的参数
  noremap = true, -- 禁止键盘映射的递归
  silent = true, -- 执行键盘映射时不显示命令行的消息
}

-- 编译文件
map( -- 关闭调试
  "n", -- 在普通模式下执行
  "<F4>", -- 触发的键盘快捷键
  ":lua require'dap'.close()<CR>" -- 关闭调试会话
    .. ":lua require'dap'.terminate()<CR>" -- 终止调试会话
    .. ":lua require'dap.repl'.close()<CR>" -- 关闭调试会话的 REPL
    .. ":lua require'dapui'.close()<CR>" -- 关闭调试界面
    .. ":lua require('dap').clear_breakpoints()<CR>" -- 清除断点
    .. "<C-w>o<CR>", -- 切换到其他窗口
  opt -- 使用上面定义的选项表
)
-- 开始/继续
-- map("n", "<F5>", ":lua require'dap'.continue()<CR>", opt) -- 开始或继续调试
-- map("n", "<F5>", ":lua execute_with_cd('powershell cexe')<CR>:lua require'dap'.continue()<CR>", opt) -- 开始或继续调试[编译并调试]

-- 根据文件类型执行相应的调试功能
-- 打开调试窗口
map("n", "<F5>", ":lua debug_by_filetype()<CR>", opt)
map("n", "<m-F5>", ":lua debug_by_filetype()<CR>", opt)

-- 设置断点
map("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<CR>", opt) -- 切换断点状态
map("n", "<S-F6>", ":lua require'dap'.clear_breakpoints()<CR>", opt) -- 清除所有断点
--  stepOver, stepOut, stepInto
map("n", "<F8>", ":lua require'dap'.step_over()<CR>", opt) -- 单步执行
map("n", "<S-F7>", ":lua require'dap'.step_out()<CR>", opt) -- 退出当前函数
map("n", "<F7>", ":lua require'dap'.step_into()<CR>", opt) -- 进入当前函数
-- 弹窗
map("n", "<S-F8>", ":lua require'dapui'.eval()<CR>", opt) -- 在当前光标位置显示变量的值
-- 调整dap窗口布局
map("n", "<F3>", ":lua window_dap()<CR>", opt)
map("n", "<F3>1", ":lua window_conti(1)<CR>", opt)
map("n", "<F3>2", ":lua window_conti(2)<CR>", opt)
map("n", "<F3>3", ":lua window_conti(3)<CR>", opt)
map("n", "<F3>4", ":lua window_conti(4)<CR>", opt)
map("n", "<F3>0", ":lua dap_default()<CR>", opt)
map("n", "<F3>h", ":lua window_dap_help()<CR>", opt)
map("n", "<m-->", ":lua window_dap_add('-')<CR>", opt)
map("n", "<m-=>", ":lua window_dap_add('+')<CR>", opt)

-- 编译代码 终端模式
-- run    [file.file]  编译并运行
-- cexe   [file.file]  编译指定文件
-- exe    [file]       运行指定程序
