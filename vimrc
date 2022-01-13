set clipboard=unnamedplus
set autowriteall
set relativenumber number
set splitbelow
set splitright
set mouse=
set nocompatible
set langmenu=en
set encoding=utf-8
set fileencodings=utf8,gbk
set backspace=2
set incsearch
set shortmess-=S
set showcmd
set ignorecase smartcase
set number
syntax on
set ruler
set autoindent
set cindent
set shiftwidth=2
set tabstop=2
set expandtab
%retab!
set history=1000
set hlsearch
set novb
set wrap
set numberwidth=4
set t_Co=256
set showtabline=2
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

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

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""                                     _                        
""                                    (_)                       
"" _ __ ___     __ _   _ __    _ __    _   _ __     __ _   ___  
""| '_ ` _ \   / _` | | '_ \  | '_ \  | | | '_ \   / _` | / __| 
""| | | | | | | (_| | | |_) | | |_) | | | | | | | | (_| | \__ \ 
""|_| |_| |_|  \__,_| | .__/  | .__/  |_| |_| |_|  \__, | |___/ 
""                    | |     | |                   __/ |       
""                    |_|     |_|                  |___/        
""
" mappings{{{
noremap <Space> <Nop>
map <Space> <Leader>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>o :Vista!!<CR>
nnoremap <leader>th :ter ++rows=10<CR>
nnoremap <leader>tv :vert :ter ++cols=55<CR>
nnoremap <leader>nh :nohl<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>cl :CocFzfList<CR>
nnoremap <leader>rn *Ncgn
nnoremap <leader>rp :REPLToggle<CR>
nnoremap <leader>c :REPLSendSession<CR>
nnoremap <leader>m :call ToggleMouse()<CR>
nnoremap <silent> <leader>s      :<C-u>CocFzfList outline<CR>
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

command -nargs=1 Vsb call VsbFunction(<f-args>)
"}}}

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""         _                  
""        | |                 
"" _ __   | |  _   _    __ _  
""| '_ \  | | | | | |  / _` | 
""| |_) | | | | |_| | | (_| | 
""| .__/  |_|  \__,_|  \__, | 
""| |                   __/ | 
""|_|                  |___/  
""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sillybun/vim-repl'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
call plug#end()

""         _                                         _    
""        | |                                       | |   
"" _ __   | |  _   _    __ _            ___    ___  | |_  
""| '_ \  | | | | | |  / _` |          / __|  / _ \ | __| 
""| |_) | | | | |_| | | (_| |          \__ \ |  __/ | |_  
""| .__/  |_|  \__,_|  \__, |          |___/  \___|  \__| 
""| |                   __/ |  ______                     
""|_|                  |___/  |______|                    
""
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"Onedark:
colorscheme onedark
set cursorline
set cursorcolumn
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"airline:
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"vista:
let g:vista_default_executive = 'coc'
let g:vista_sidebar_position = 'vertical topleft'
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"repl:
let g:repl_position = 3
let g:repl_code_block_fences = {'python': '#%%', 'zsh': '# %%', 'markdown': '```'}
""hi Pmenu ctermbg=Gray 
""hi Pmenusel ctermfg=White
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"nerdtree:
let NERDTreeShowHidden=1
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"Exit insert mode
autocmd InsertLeave * call Fcitx2en()
"Enter insert mode
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
