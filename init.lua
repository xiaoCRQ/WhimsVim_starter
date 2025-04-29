-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.neovide")
require("config.function")
require("lsp.init")
require("dap-config.init")

-- vim.opt.shell = "powershell.exe"
-- vim.opt.shellcmdflag = "-NoProfile"
vim.o.swapfile = false -- 关闭 打开文件询问

vim.o.fileencodings = "ucs-bom,utf-8,gbk,default,latin1"
vim.o.fileencoding = "gbk"
