" @Version: 2025-04-02 11:01
" @Author : ACupofAir
"
"==============================configs==============================
syntax on
set autochdir
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

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

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
