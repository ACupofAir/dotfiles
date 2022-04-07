if exists('g:vscode')
    " VSCode extension
    "
" configs {{{

    set buftype=" "
    set autowriteall
    set relativenumber number
    set mouse=
    set nocompatible
    let $LANG = 'en'  "set message language
    set langmenu=en   "set menu's language of gvim. no spaces beside '='
    set encoding=utf-8
    set fileencodings=utf8,gbk
    set backspace=2
    set incsearch
    set shortmess-=S
    set showcmd
    set ignorecase smartcase
    " set clipboard=unnamed "Win
    set clipboard=unnamedplus "Linux
    set number
    set ruler
    set foldenable
    set autoindent
    set cindent

    set shiftwidth=4 "设置缩进长度"
    set tabstop=4 "设置tab长度，一般tab长度为8"
    set softtabstop=4
    set expandtab
    %retab!

    set history=1000
    set hlsearch
    set novb
    set noerrorbells
    set wrap
    set numberwidth=4
    set t_Co=256
    set showtabline=2
    set foldmethod=marker
    " }}}
    "
    " mappings{{{
    noremap <Space> <Nop>
    map <Space> <Leader>
    nnoremap <leader>nh :nohl<CR>
    nnoremap <leader>rn *Ncgn
    nnoremap <silent> <leader>f <Cmd>call VSCodeCall('workbench.action.quickOpen')<CR>
    nnoremap <silent> <leader>w <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
    nnoremap <silent> <leader>q <Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
    nnoremap <silent> <leader>e <Cmd>call VSCodeCall('workbench.view.explorer')<CR>
    nnoremap <silent> <leader>s <Cmd>call VSCodeCall('workbench.action.gotoSymbol')<CR>
    nnoremap <silent> <leader>o <Cmd>call VSCodeCall('outline.focus')<CR>

    "}}}
else
    " ordinary neovim
    "
" configs {{{
    set autowriteall
    set relativenumber number
    set mouse=
    set nocompatible
    let $LANG = 'en'  "set message language
    set langmenu=en   "set menu's language of gvim. no spaces beside '='
    set encoding=utf-8
    set fileencodings=utf8,gbk
    set backspace=2
    set incsearch
    set shortmess-=S
    set showcmd
    set ignorecase smartcase
    set clipboard=unnamed
    set number
    set ruler
    set foldenable
    set autoindent
    set cindent

    set shiftwidth=4 "设置缩进长度"
    set tabstop=4 "设置tab长度，一般tab长度为8"
    set softtabstop=4
    set expandtab
    %retab!

    set history=1000
    set hlsearch
    set novb
    set noerrorbells
    set wrap
    set numberwidth=4
    set t_Co=256
    set showtabline=2
    set foldmethod=marker
    " }}}
    "
    " mappings{{{
    noremap <Space> <Nop>
    map <Space> <Leader>
    nnoremap <leader>nh :nohl<CR>
    nnoremap <leader>q :q!<CR>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>rn *Ncgn
    nnoremap <leader>m :call ToggleMouse()<CR>
    " Maps Ctrl-[h,j,k,l] to resizing a window split
    map <silent> <C-h> <C-w><
    map <silent> <C-j> <C-W>-
    map <silent> <C-k> <C-W>+
    map <silent> <C-l> <C-w>>
    nnoremap <ESC><ESC> :call popup_close(win_getid())<CR>
    autocmd FileType html inoremap <buffer> ><space> ><Esc>F<lyt>o</<C-r>"><Esc>kJxi

    tnoremap <Esc> <C-\><C-n>

    command -nargs=1 Vsb call VsbFunction(<f-args>)
    inoremap ( ()<LEFT>
    inoremap [ []<LEFT>
    inoremap { {}<LEFT>
    inoremap ' ''<LEFT>
    inoremap " ""<LEFT>
    "}}}

endif

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()
