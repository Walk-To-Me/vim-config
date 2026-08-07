# vim-config

精简的 Vim/GVim 配置文件，适用于 Linux 内网机器间快速部署。

## 包含的插件

- [NERDTree](https://github.com/preservim/nerdtree)：文件树（`Ctrl-n` 开关）
- [vim-airline](https://github.com/vim-airline/vim-airline) 与 vim-airline-themes：状态栏与标签栏
- [gruvbox](https://github.com/morhetz/gruvbox)：深色配色主题

## 安装

```bash
git clone git@github.com:Walk-To-Me/vim-config.git ~/vim-config
ln -sf ~/vim-config/vimrc ~/.vimrc
ln -sf ~/vim-config/gvimrc ~/.gvimrc
ln -sf ~/vim-config/vim ~/.vim
vim +PlugInstall +qall
```

`PlugInstall` 会将上述四个插件安装到 `~/.vim/plugged`。

## 外部依赖

以下工具为可选依赖，缺少时相关功能不可用但不影响 vim 正常使用：

| 工具 | 用途 |
|------|------|
| JetBrainsMono Nerd Font | GVim 字体 |

## 兼容要求

- Vim >= 8.0
- 终端 Vim 无 X11 时，注释掉 `.vimrc` 中 `set clipboard=unnamedplus` 一行
