return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,

  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local alpha = require("alpha")
    require("alpha.term")

    dashboard.section.terminal.command =
      "chafa -c full --fg-only --symbols braille --align=mid C:/Users/xiaoCRQ/AppData/Local/nvim/lua/logo/v-3.gif"

    dashboard.section.terminal.width = 80
    dashboard.section.terminal.height = 24
    dashboard.section.terminal.opts.redraw = true
    dashboard.section.terminal.opts.window_config.zindex = 1

    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       LazyVim.pick()),
      -- dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      -- dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
      -- dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
      -- dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("l", " " .. " LeetCode",            "<cmd> Leet <cr>"),
      dashboard.button("c", " " .. " Config",          LazyVim.pick.config_files()),
      -- dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      -- dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    -- Obtain Date Info
    local date = os.date("*t")
    local weekday = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
    local date_info = "󰨲 Today is " .. weekday[date.wday] .. "  " .. "time is " .. os.date("%H:%M")
    local date_today = {
      type = "text",
      val = date_info,
      opts = {
        position = "center",
        hl = "Keyword",
      },
    }

    local daily_words = {
      type = "text",
      val = "You'll become a person fitting of that name, and not just a tool.",
      opts = {
        position = "center",
        hl = "Keyword",
      },
    }

    local daily_words_name = {
      type = "text",
      val = "                            ———— Violet Evergarden",
      opts = {
        position = "center",
        hl = "Keyword",
      },
    }

    dashboard.opts.layout = {
      { type = "padding", val = 2 },
      dashboard.section.terminal,
      daily_words,
      daily_words_name,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      dashboard.section.footer,
      date_today,
    }

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    date_today.opts.hl = "date_today"
    daily_words.opts.hl = "daily_words"
    daily_words_name.opts.hl = "daily_words_name"

    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#A3DAFF", bold = true })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#A3DAFF", bold = true })
    vim.api.nvim_set_hl(0, "date_today", { fg = "#8DBEFF", italic = true })
    vim.api.nvim_set_hl(0, "daily_words", { fg = "#8DBEFF", italic = true })
    vim.api.nvim_set_hl(0, "daily_words_name", { fg = "#8DBEFF", italic = true })
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
        vim.defer_fn(function()
          vim.cmd("AlphaRedraw")
          vim.notify = require("notify")
          local hour = tonumber(os.date("%H"))
          if hour < 12 then -- 凌晨
            vim.notify("Good Morning —— 早上好！")
          elseif hour < 14 then -- 中午
            vim.notify("Good Noon —— 中午好！")
          elseif hour < 18 then -- 下午
            vim.notify("Good Afternoon —— 下午好！")
          elseif hour < 24 then -- 晚上
            vim.notify("Good Night —— 晚上好！")
          end
        end, 5)
      end,
    })
  end,
}
