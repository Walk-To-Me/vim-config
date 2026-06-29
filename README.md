# vim-config

Vim/GVim 配置文件，适用于 Linux 内网机器间快速部署。

## 安装

```bash
git clone git@github.com:Walk-To-Me/vim-config.git
ln -sf ~/vim-config/vimrc ~/.vimrc
ln -sf ~/vim-config/gvimrc ~/.gvimrc
ln -sf ~/vim-config/vim ~/.vim
vim +PlugInstall +qall
```

## 外部依赖

以下工具为可选依赖，缺少时相关功能不可用但不影响 vim 正常使用：

| 工具 | 用途 |
|------|------|
| git | vim-fugitive、vim-gitgutter |
| ctags | vim-gutentags 标签跳转 |
| flake8, mypy | Python 代码检查 (ALE) |
| black | Python 格式化 (ALE) |
| verilator | Verilog/SystemVerilog 检查 (ALE) |
| JetBrainsMono Nerd Font | GVim 字体 |

## 兼容要求

- Vim >= 8.0，需 `+python3` 支持
- 终端 Vim 无 X11 时，注释掉 `.vimrc` 中 `set clipboard=unnamedplus` 一行
