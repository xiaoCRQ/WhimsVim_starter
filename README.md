WhimsVim 是由 [💤 lazy.nvim](https://github.com/folke/lazy.nvim) 驱动并基于[💤 lazyvim](https://github.com/LazyVim/LazyVim)的一套 Neovim 配置，可以轻松自定义和扩展您的配置。
不必在从头开始或使用预制发行版之间做选择，

![image](https://github.com/xiaoCRQ/WhimsVim/blob/main/introduce/img/dashboard.png)
![image](https://github.com/xiaoCRQ/WhimsVim/blob/main/introduce/img/interface.png)

## ✨ 特性

- 🔥 将你的 Neovim 变成一个成熟的 IDE
- 💤 使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 轻松自定义和扩展您的配置
- 🚀 快如闪电
- 🧹 选项、自动命令和键盘映射的合理预设
- 📦 预配置了大量插件，随时可用

## ⚡️ 要求

- Neovim >= **0.9.0** (需要用 **LuaJIT** 构建)
- Git >= **2.19.0** (用于部分克隆支持)
- 一个 [Nerd Font](https://www.nerdfonts.com/) 字体 **_(可选)_**
- 一个用于 `nvim-treesitter` 的 **C** 编译器。看 [这里](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

## 🚀 入门

您可以在 [此处](https://github.com/xiaoCRQ/WhimsVim/tree/main/nvim) 找到 **VhimsVim** 的入门模板

<details><summary> 安装 <a href="https://github.com/xiaoCRQ/WhimsVim/tree/main/nvim">Whimsvim</a></summary>

- 备份您当前的 Neovim 文件

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- 克隆 WhimsVim

  ```sh
  git clone https://github.com/xiaoCRQ/WhimsVim/tree/main/nvim ~/.config/nvim
  ```

- 删除 `.git` 文件夹，以便稍后将其添加到您自己的存储库

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- 启动 Neovim!

  ```sh
  nvim
  ```

</details>

---

## 📂 文件结构

config 下的文件会在适当的时候自动加载，所以你不需要手动引入这些文件。
**LazyVim** 带有一组默认配置文件，这些文件将在您的配置**之前**加载。

您可以在 `lua/plugins/` 下添加自定义插件配置(specs)。
[lazy.nvim](https://github.com/folke/lazy.nvim) 会自动加载这些文件。

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>

## ⚙️ Configuration
