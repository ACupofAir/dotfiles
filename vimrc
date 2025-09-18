" @Version: Wed Jul 30 10:57:06 AM CST 2025
" @Author : ACupofAir
" recommend to install ctags: <http://github.com/universal-ctags/>
"==============================configs==============================
syntax on
"colorscheme desert
set wildmenu
set number
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ENC=%{&fileencoding}]\ [FORMAT=%{&fileformat}]\ [POS=%l,%c]\ [%p%%]

"==============================mappings==============================
noremap <Space> <Nop>
map <Space> <Leader>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>rn *Ncgn

"==============================  plugs  ==============================
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/vim-oscyank', {'branch': 'main'} "for tmux: set -s set-clipboard on
call plug#end()

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>sc :History:<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sg :RG<CR>
nnoremap <leader>sl :BLines<CR>
nnoremap <leader>ss :Tags<CR>

augroup Yank
      autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | execute 'OSCYankRegister "' | endif
augroup END

