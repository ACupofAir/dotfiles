# dotfiles
Organize my dotfiles with ln command; and sync them with git.

## zshrc
* Clone this repository to your own machine
* `ln -s thisFoldPosition ~/.zshrc`
* You should change the proxy ip and port in my zshrc

## vimrc
* Clone this repository to your own machine
* Install [vim-plug](https://github.com/junegunn/vim-plug)
* `ln -s thisFoldPosition/vimrc ~/.vimrc`
* Open your vim, and type `:PlugInstall` to install the plugs in my dotfile
* **notice:** You may need set your proxy firstly(If you have config the zshrc, you can use `pxon` command)
