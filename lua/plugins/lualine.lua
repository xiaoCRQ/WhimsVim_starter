return {
  "nvim-lualine/lualine.nvim", -- 指定要配置的插件
  event = "VeryLazy", -- 触发配置的事件
  init = function() -- 初始化函数，用于设置一些初始状态
    vim.g.lualine_laststatus = vim.o.laststatus -- 保存当前的状态栏设置
    if vim.fn.argc(-1) > 0 then
      -- 如果有文件作为参数传递给 Neovim，则设置一个空的状态栏直到 lualine 加载
      vim.o.statusline = " "
    else
      -- 如果没有文件作为参数传递，隐藏启动页面的状态栏
      vim.o.laststatus = 0
    end
  end,
  opts = function() -- 配置选项函数
    -- 性能优化，避免重复加载 require
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons -- 加载图标配置

    vim.o.laststatus = vim.g.lualine_laststatus -- 恢复之前保存的状态栏设置

    return { -- lualine 的配置选项
      tabline = {}, -- 设置标签栏的配置，这里为空表示使用默认配置
      winbar = {}, -- 设置 winbar 的配置，这里为空表示使用默认配置
      inactive_winbar = {}, -- 设置非活动 winbar 的配置，这里为空表示使用默认配置
      extensions = { "nvim-tree", "neo-tree", "lazy" }, -- 启用的扩展
      options = { -- lualine 的全局选项
        icons_enabled = true, -- 启用图标
        theme = "auto", -- 主题设置为自动
        globalstatus = true, -- 全局状态栏
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } }, -- 在某些文件类型中禁用状态栏
        refresh = { -- 设置刷新率
          statusline = 1000, -- 状态栏刷新时间（毫秒）
          tabline = 1000, -- 标签栏刷新时间（毫秒）
          winbar = 1000, -- winbar 刷新时间（毫秒）
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
          -- left = "", --"  or  or ",
          -- right = "", --" or  or ",
          left = "", --"  or  or ",
          right = "", --" or  or ",
        },
        -- 分割线
        -- component_separators = '|',
        component_separators = {
          left = "", --" or | or "
          right = "", --" or | or "
        },
      },
      --————————————————————————————————————————————————————————————
      sections = { -- 定义状态栏的不同部分
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        lualine_a = {
          "mode",
        },
        lualine_b = { "branch" },
        lualine_c = {
          LazyVim.lualine.root_dir(), -- 显示当前项目的根目录
          {
            "diagnostics", -- 显示诊断信息
            symbols = { -- 使用自定义图标
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }, -- 显示文件类型，仅图标，无分隔符
          { LazyVim.lualine.pretty_path() }, -- 显示文件路径，使用自定义函数美化
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = LazyVim.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = LazyVim.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = LazyVim.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = LazyVim.ui.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },

        lualine_y = {
          {
            function()
              local fenc = vim.bo.fenc -- 获取文件的编码
              if fenc == "cp936" then
                return "GBK"
              elseif fenc == "euc-cn" then
                return "GB2312"
              elseif fenc == "latin1" then
                return "ISO-8859-1"
              elseif fenc == "utf-8" then
                return "UTF-8"
              elseif fenc == "utf-16" then
                return "UTF-16"
              elseif fenc == "big5" then
                return "BIG25"
              else
                return fenc -- 显示其他编码
              end
            end,

            color = function()
              return LazyVim.ui.fg("Type")
            end,
          },
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          -- { "location", padding = { left = 0, right = 1 } },
        },

        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      --————————————————————————————————————————————————————————————
    }
  end,
}
