-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 键盘快捷输入
local keymap = vim.keymap
keymap.set("n", "N", "jjjjj")
keymap.set("n", "M", "kkkkk")
keymap.set("n", ";;", ":")
keymap.set("n", "U", "<C-r>")
keymap.set("n", "11", "!")
keymap.set("n", "22", "@")
keymap.set("n", "33", "#")
keymap.set("n", "44", "$")
keymap.set("n", "55", "%")
keymap.set("n", "66", "^")
keymap.set("n", "77", "&")
keymap.set("n", "88", "*")
keymap.set("n", "99", "()<left>")
keymap.set("n", "00", ")")

keymap.set("i", "jj", "<Esc>")
keymap.set("i", "1", "1")
keymap.set("i", "2", "2")
keymap.set("i", "3", "3")
keymap.set("i", "4", "4")
keymap.set("i", "5", "5")
keymap.set("i", "6", "6")
keymap.set("i", "7", "7")
keymap.set("i", "8", "8")
keymap.set("i", "9", "9")
keymap.set("i", "0", "0")
keymap.set("i", "11", "!")
keymap.set("i", "22", "@")
keymap.set("i", "33", "#")
keymap.set("i", "44", "$")
keymap.set("i", "55", "%")
keymap.set("i", "66", "^")
keymap.set("i", "77", "&")
keymap.set("i", "88", "*")
keymap.set("i", "99", "()<left>")
-- keymap.set("i", "99", "(")
keymap.set("i", "00", ")")
keymap.set("i", "-", "-")
keymap.set("i", "--", "--")
keymap.set("i", "---", "_")
keymap.set("i", "=", "=")
keymap.set("i", "==", "==")
keymap.set("i", "===", "+")
keymap.set("i", ",,", "<")
keymap.set("i", ",,,", "<><left>")
-- keymap.set("i", ",,", "<")
keymap.set("i", "..", ">")
keymap.set("i", "[[", "{}<left>")
-- keymap.set("i", "[[", "{")
keymap.set("i", "]]", "}")
keymap.set("i", ";;", ":")
keymap.set("i", "``", "~")
keymap.set("i", "//", "//")
keymap.set("i", "///", "?")
keymap.set("i", "\\\\", "|")
keymap.set("i", "【", "【】<left>")
keymap.set("i", "【【", "[]<left>")
keymap.set("i", "【【【", "{}<left>")
-- keymap.set("i", "【", "【")
-- keymap.set("i", "【【", "[")
-- keymap.set("i", "【【【", "{")
keymap.set("i", "】", "】")
keymap.set("i", "】】", "]")
keymap.set("i", "】】】", "}")
keymap.set("i", ",", ",")
keymap.set("i", ".", ".")
keymap.set("i", "[", "[]<left>")
-- keymap.set("i", "[", "[")
keymap.set("i", "]", "]")
keymap.set("i", ";", ";")
keymap.set("i", "`", "`")
keymap.set("i", "/", "/")
keymap.set("i", "：", ":")
-- keymap.set("i", "；", ";")
-- keymap.set("i", "；；", ":")
keymap.set("i", "，", "，")
keymap.set("i", "，，", "<")
keymap.set("i", "，，，", "<><left>")
keymap.set("i", "'", "''<left>")
keymap.set("i", "‘", "''<left>")
keymap.set("i", "’", "''<left>")
keymap.set("i", "''", '""<left>')
keymap.set("i", "’‘", '""<left>')
keymap.set("i", "‘’", '""<left>')
keymap.set("i", "“”", '""<left>')
keymap.set("i", "”“", '""<left>')
keymap.set("i", "\\", "\\")

-- keymap.set("", "", "")

local map = vim.api.nvim_set_keymap -- 创建键盘映射的函数
local cmp = require("cmp")
local opt = { -- 选项表，用于指定键盘映射的参数
  noremap = true, -- 禁止键盘映射的递归
  silent = true, -- 执行键盘映射时不显示命令行的消息
}

-- -- 设置 <Tab> 键作为触发补全的按键
-- cmp.setup({
--   mapping = {
--     ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--     ["<CR>"] = cmp.mapping.abort(), -- 禁用enter的自动补全
--   },
--   sources = { { name = "nvim_lsp" } },
-- })
-- 设置分屏跳转快捷键
map("n", "<m-h>", "<C-w>h", opt)
map("n", "<m-l>", "<C-w>l", opt)
map("n", "<m-j>", "<C-w>j", opt)
map("n", "<m-k>", "<C-w>k", opt)

map("n", "q", ":bd<CR>", opt)
map("n", "qf", ":bd<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "qa", ":qa!<CR>", opt)
map("n", "qw", ":wq!<CR>", opt)
map("n", "qwa", ":w!<CR> :qa<CR>", opt)
map("n", "w", ":w!<CR>", opt)
map("n", "wq", ":wq!<CR>", opt)
map("n", "wqa", ":w!<CR> :qa<CR>", opt)
-- map("n", "<F2>1", ":e ++enc=utf-8<CR>", opt)
-- map("n", "<F2>2", ":e ++enc=gbk<CR>", opt)
map("n", "<F2>u", ":lua encod('u')<CR>", opt)
map("n", "<F2>g", ":lua encod('g')<CR>", opt)
map("n", "<F2>h", ":lua encod('h')<CR>", opt)
map("n", "<F2>i", ":lua encod('i')<CR>", opt)
map("n", "<F2>gb", ":lua encod('gb')<CR>", opt)
map("n", "<F2>bg", ":lua encod('bg')<CR>", opt)
map("n", "<F2>", ":lua encod('0')<CR>", opt)
map("n", "<C-->", ":lua font('-')<CR>", opt)
map("v", "<C-->", ":lua font('-')<CR>", opt)
map("n", "<C-=>", ":lua font('+')<CR>", opt)
map("v", "<C-=>", ":lua font('+')<CR>", opt)
map("n", "<S-W>", ":vsp<CR>", opt)
map("n", "<S-S>", ":sp<CR>", opt)

-- leetcode 快捷操作
map("n", "<leader>lc", ":Leet <CR>", opt)
map("n", "<leader>lg", ":Leet lang<CR>", opt)
map("n", "<leader>ls", ":Leet submit<CR>", opt)
map("n", "<leader>ln", ":Leet run<CR>", opt)
map("n", "<leader>le", ":Leet exit<CR>", opt)
map("n", "<leader>li", ":Leet info<CR>", opt)
map("n", "<leader>lta", ":Leet tabs<CR>", opt)
map("n", "<leader>ly", ":Leet yank<CR>", opt)
map("n", "<leader>ld", ":Leet daily<CR>", opt)
map("n", "<leader>lts", ":Leet list<CR>", opt)
map("n", "<leader>lo", ":Leet open<CR>", opt)
map("n", "<leader>lre", ":Leet reset<CR>", opt)
map("n", "<leader>lrt", ":Leet restore<CR>", opt)
map("n", "<leader>lkd", ":Leet cookie delete<CR>", opt)
map("n", "<leader>lku", ":Leet cookie update<CR>", opt)
map("n", "<leader>lkc", ":Leet cache<CR>", opt)
map("n", "<leader>lh", ":h leetcode.nvim-commands<CR>", opt)

-- 使用 PowerShell 作为 Neovim 的终端 vim.opt.shell = "powershell"
-- 按下 F5 键打开一个小的弹窗 PowerShell 终端
-- vim.api.nvim_set_keymap("n", "<F5>", "<cmd>botright terminal<CR>", { noremap = true, silent = true })

-- 设置终端模式下的按键映射
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- 窗口左移
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- 窗口下移
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- 窗口上移
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- 窗口右移
  vim.keymap.set("t", "qq", [[<C-\><C-n><C-w>]], opts) -- 关闭终端
  vim.keymap.set("n", "qq", [[<C-\><C-n><C-w>]], opts) -- 关闭终端
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

map("n", "<c-o>", ":lua require('lazyvim.util').telescope.config_files()() <CR>", opt) -- 打开配置文件列表
map("n", "<c-f>", ":Telescope find_files <cr>", opt) -- 打开搜索文件
