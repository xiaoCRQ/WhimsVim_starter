return {
  -- Ensure C/C++ debugger is installed
  "williamboman/mason.nvim",
  optional = true,
  opts = {
    ensure_installed = {
      -- c and c++
      "clang-format",
      "clangd",
      "codelldb",
      "cpplint",
      -- html and css
      "html-lsp",
      "markuplint",
      "prettier",
      "css-lsp",
      "stylelint",
      -- markdown
      "markdown-toc",
      "markdownlint-cli2",
      "marksman",
      -- other
      "debugpy",
      "json-lsp",
      "lua-language-server",
      "pyright",
      "shfmt",
      "stylua",
    },
  },
}
