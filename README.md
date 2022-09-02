<h1 align=center>
dotfiles
</h1>

> Organize my dotfiles with ln command; and sync them with git.

## :toolbox:Usage

### Zsh Config `zshrc`

- Clone this repository to your own machine
- `ln -s thisFoldPosition ~/.zshrc`
- You should change the proxy ip and port in my zshrc

### Vim Config `vimrc`

- Clone this repository to your own machine
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- `ln -s thisFoldPosition/vimrc ~/.vimrc`
- Open your vim, and type `:PlugInstall` to install the plugs in my dotfile
- **notice:** You may need set your proxy firstly(If you have config the zshrc, you can use `pxon` command)

### Neovim Config `init.lua`

- On windows :window: wiht :link:[Atsrovim](AstroNvim/AstroNvim) `ln init.lua ~/AppData/Local/nvim/lua/user/init.lua`

## :warning:note

- On windows: `ln -s` will not work right, should use hard link `ln file1 file2`
