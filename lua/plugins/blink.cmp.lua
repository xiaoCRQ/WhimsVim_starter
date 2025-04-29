return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    keymap = {
      ["<C-y>"] = { "select_and_accept" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    sources = {
      default = { "dictionary", "lsp", "path", "buffer" },
      providers = {
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          min_keyword_length = 3,
          opts = {
            -- 使用 vim.fn.stdpath 获取 Neovim 配置路径
            dictionary_files = { vim.fn.expand(vim.fn.stdpath("config") .. "/lua/resource/words_alpha.txt") },
          },
        },
      },
    },
    snippets = {
      preset = "luasnip", -- 使用新的预设配置
    },
  },
}
