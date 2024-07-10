local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    -- "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "octaltree/cmp-look",
  },
}

M.config = function()
  local cmp = require("cmp")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sorting = {
      priority_weight = 1.0,
      comparators = {
        -- compare.score_offset, -- not good at all
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
        cmp.config.compare.offset,
        cmp.config.compare.order,
        -- compare.scopes, -- what?
        -- compare.sort_text,
        -- compare.exact,
        -- compare.kind,
        -- compare.length, -- useless
      },
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local lspkind_icons = {
          Text = "",
          Method = "",
          Function = "󰊕",
          Constructor = "󰡱",
          Field = "",
          Variable = "",
          Class = "",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = " ",
          Robot = "󱚤",
          Roboti = "󱨚",
          Smiley = " ",
          Note = " ",
        }
        local meta_type = vim_item.kind
        -- load lspkind icons
        vim_item.kind = lspkind_icons[vim_item.kind]
        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = lspkind_icons["Robot"]
          -- vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        -- if entry.source.name == 'emoji' then
        --     vim_item.kind = lspkind_icons['Smiley']
        --     vim_item.kind_hl_group = 'CmpItemKindEmoji'
        -- end

        if entry.source.name == "look" then
          vim_item.kind = lspkind_icons["Note"]
          -- vim_item.kind_hl_group = "CmpItemKindEmoji"
        end
        -- if entry.source.name == 'codeium' then
        --     vim_item.kind = lspkind_icons['Roboti']
        --     -- vim_item.kind_hl_group = "CmpItemKindEmoji"
        -- end
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = meta_type,
          path = "[Path]",
          luasnip = "[LuaSnip]",
          cmp_tabnine = "[TN]",
          emoji = "[Emoji]",
          look = "[Dict]",
          -- codeium = '[Code]',
        })[entry.source.name]

        return vim_item
      end,
    },

    sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "cmp_tabnine" },
      { name = "path" },
      { name = "buffer" },
      -- { name = "emoji" },
      { name = "nvim_lsp_signature_help" },
      {
        name = "look",
        keyword_length = 2,
        max_item_count = 5,
        option = {
          convert_case = true,
          loud = true,
          -- dict = "C:/Program Files/compiler/words/words.txt",
        },
      },
      { name = "orgmode" },
    }),
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
