" @Version: 2025-07-10 09:33
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
      let bufn = bufname(i)
      if empty(bufn)
          let bufn = '[No Name]'
      endif

      let is_modified = getbufvar(i, '&modified')

      if i == bufnr('%')
        if is_modified
            let s .= '%#TabLineSelModified#' . bufn . '*%#TabLineFill#|'
        else
            let s .= '%#TabLineSel#' . bufn . '*%#TabLineFill#|'
        endif
      else
        if is_modified
            let s .= '%#TabLineModified#' . bufn . '*%#TabLineFill#|'
        else
            let s .= '%#TabLine#' . bufn . '%#TabLineFill#|'
        endif
      endif
    endif
  endfor
  return s
endfunction

"==============================highlight==============================
highlight TabLineSel ctermfg=white ctermbg=green cterm=bold
highlight TabLine ctermfg=darkgray ctermbg=black
highlight TabLineFill ctermfg=black ctermbg=black
highlight TabLineModified ctermfg=white ctermbg=black
highlight TabLineSelModified ctermfg=white ctermbg=red cterm=bold


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
