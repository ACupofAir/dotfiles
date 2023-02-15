<h1 align=center>
dotfiles
</h1>

> Organize my dotfiles with ln command; and sync them with git.

## :gear:Setup

### PowerShell Config

- lookup the powershell version `$PSVersionTable`
- Install powershell 7
- `mkdir ~/Document/PowerShell`
- Install [StarShip](https://github.com/starship/starship) `scoop install starship`
- Install :link:[PSReadline](https://github.com/PowerShell/PSReadLine) click the link and look the readme
- Install module [write-big-char](https://github.com/ACupofAir/Write-Big-Char): `Install-Module -Name Write-Big-Char`
- Install module [directory-stack](https://github.com/ACupofAir/Directory-Stack): `Install-Module -Name directory-stack`
- `ln -s xxx/dotfile/Microsoft.PowerShell_profile.ps1 $profile`

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

> `init_offline.lua` is the offline version of user/init.lua

- On windows :window: with :link:[Atsronvim](https://astronvim.github.io/), follow the official tutor to install astronvim
- make the customer user folder to use the init.lua in the dotfiles
  - `mkdir ~/AppData/Local/nvim/lua/user/`
- link the init.lua to the target position to apply it
  - **change the user_name to your local folder**
  - `sudo ln -s init.lua C:\Users\user_name\AppData\Local\nvim\lua\user\init.lua`

## :toolbox:Usage

### PowerShell

- Directors Stack Function (no need install other plugins)
  ![dir_stack_demo](res/dir_stack_demo.gif)
  - `pd`: pushd the current directory into stack
  - `pd $dir_name`: pushd the directory named `$dir_name` into stack
  - `dv`: show the directory in stack(dv is the alias from `dirs -v` on linux)
  - `pd $index`: switch to the directory in stack whose index is `$index`
  - `pp $index`: popd the directory whose index is `$index` from stack
- Proxy Usage
  - `pxon`: set proxy
  - `pxoff`: clear proxy
  - `Set-Git-Proxy`: set git proxy
- Historys
  - need install [PSReadline](https://github.com/PowerShell/PSReadLine)
  - `historys` will show all powershell command history
- Translator
  - need install python and [google-translate-for-goldendict](https://github.com/xinebf/google-translate-for-goldendict)
  - `trans $text` will translate `$text` to English or Chinese
- Draw String Bigger
  ![](https://github.com/ACupofAir/Write-Big-Char/blob/main/res/2023-02-15-17-06-07.png?raw=true)
  - `draw $TEXT`: draw `$TEXT` bigger on powershell

## :warning:note

- Should use full path `ln -s $fullpath/dotfile/xxx $fullpath/xxx`
- Should use `sudo` prefix
