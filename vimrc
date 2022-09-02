"v2021.07.15.11_Linux

" configs {{{
set autochdir
set ttimeoutlen=0
set guioptions-=m
set guioptions-=T
set autowriteall
set relativenumber number
set splitbelow
set splitright
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
set termguicolors
set showtabline=2
set foldmethod=marker
" set guifont=Hasklug_Nerd_Font:h14
set guifont=agave_NF:h16
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

filetype off
" }}}

" functions {{{
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"ToggleMouse:
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"Vsb:
function VsbFunction (arg1)
    execute 'vert sb' a:arg1
endfunction
"}}}

" mappings{{{
noremap <Space> <Nop>
map <Space> <Leader>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>th :ter ++rows=10<CR>
nnoremap <leader>tv :vert :ter ++cols=55<CR>
nnoremap <leader>nh :nohl<CR>
noremap <leader>qq :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>rn *Ncgn
nnoremap <leader>ma :call ToggleMouse()<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>o :Vista coc<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>cl :CocFzfList<CR>
nnoremap <leader>mp :CocCommand markdown-preview-enhanced.openPreview<CR>
" Maps Ctrl-[h,j,k,l] to resizing a window split
map <silent> <C-h> <C-w><
map <silent> <C-j> <C-W>-
map <silent> <C-k> <C-W>+
map <silent> <C-l> <C-w>>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
nnoremap <ESC><ESC> :call popup_close(win_getid())<CR>
autocmd FileType html inoremap <buffer> ><space> ><Esc>F<lyt>o</<C-r>"><Esc>kJxi

tnoremap <Esc> <C-\><C-n>

" Open the file explorer on windows with the pwd:"
nmap <C-S-R> :!start explorer /select,%:p<CR>

"ctrl space to toggle coc refresh"
inoremap <silent><expr> <c-space> coc#refresh()

command -nargs=1 Vsb call VsbFunction(<f-args>)
"}}}

" Plugins {{{
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ferrine/md-img-paste.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'liuchengxu/vista.vim'
" "Plug 'vadskye/vim-emotions'
call plug#end()

"}}}

" Plug Settings:{{{
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Onedark:
colorscheme onedark

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Airline:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Markdown Image Paste:
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'res'
" let g:mdip_imgname = 'image'

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Vista Settings:
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Vimrepeat Settings:
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Coc Settings:
" Enter to ensure the popup menu
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" }}}
"
syntax on
