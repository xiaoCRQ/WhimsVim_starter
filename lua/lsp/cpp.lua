local map = vim.api.nvim_set_keymap -- 创建键盘映射的函数
local opt = { -- 选项表，用于指定键盘映射的参数
  noremap = true, -- 禁止键盘映射的递归
  silent = true, -- 执行键盘映射时不显示命令行的消息
}

function Complete_semicolon() -- 补全分号
  -- 获取当前文件的类型
  local filetype = vim.bo.filetype
  -- 检查文件类型是否为C或C++
  if filetype == "c" or filetype == "cpp" then
    -- 获取当前光标所在行的内容
    local current_line = vim.fn.getline(".")
    -- 在行末添加分号
    local modified_line = current_line .. ";"
    -- 替换原始行
    vim.fn.setline(".", modified_line)
  end
end

map("n", ";", ":lua Complete_semicolon()<CR>", opt)
