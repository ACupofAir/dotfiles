" @Version: 2025-01-15 22:29
" @Author : ACupofAir
"
"==============================configs==============================
syntax on
set autochdir
set wildmenu
set number
set showtabline=2
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
        let s .= '%#TabLineSel#' . bufname(i) . '*'
      else
        let s .= '%#TabLine#' . bufname(i) . ' '
      endif
    endif
  endfor
  return s
endfunction
