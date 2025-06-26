" @Version: 2025-06-27 01:29
" @Author : ACupofAir
"
"==============================configs==============================
syntax on
set wildmenu
set number
set showtabline=2
set tabstop=4
set shiftwidth=4
set expandtab
set tabline=%!MyTabLine()

"==============================mappings==============================
noremap <Space> <Nop>
map <Space> <Leader>
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>rn *Ncgn

"==============================function==============================

function! MyTabLine()
  let s = ''
  for i in range(1, bufnr('$'))
    if buflisted(i)
      if i == bufnr('%')
        " highlight tabline
        let s .= '%#TabLineSel#' . bufname(i) . '*%#TabLineFill#|'
      else
        let s .= '%#TabLine#' . bufname(i) . '%#TabLineFill#|'
      endif
    endif
  endfor
  return s
endfunction

"==============================highlight==============================
highlight TabLineSel ctermfg=white ctermbg=blue cterm=bold
highlight TabLine ctermfg=darkgray ctermbg=black
highlight TabLineFill ctermfg=black ctermbg=black

"==============================  plugs  ==============================
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>sc :History:<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sg :RG<CR>
nnoremap <leader>sl :BLines<CR>
