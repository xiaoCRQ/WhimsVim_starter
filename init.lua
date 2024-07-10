-- bootstrap lazy.nvim, LazyVim and your plugins
-- 操作手册
-- require("")  调用文件
require("neovide.init") -- neovide 界面配置
require("config.lazy")
require("config.function")
require("dap-config.init")
require("lsp.init")
-- require("theme.init")

vim.cmd("colorscheme catppuccin-mocha") -- 设置默认主题
vim.cmd("colorscheme tokyonight") -- 设置默认主题

-- vim.opt.shell = "powershell.exe"
-- vim.opt.shellcmdflag = "-NoProfile"
vim.o.swapfile = false -- 关闭 打开文件询问

vim.o.fileencodings = "ucs-bom,utf-8,gbk,default,latin1"
vim.o.fileencoding = "gbk"
