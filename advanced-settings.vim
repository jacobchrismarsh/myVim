"=====================ADVANCED VIM SETTINGS====================================

" Prevents Vim from making those annoying backup files
set nobackup
set noswapfile


" Returns to the last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\""|
            \ endif


" Deletes trailing white space on save for python code
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


" Automatically resizes vim splits if the terminal window is resized
:autocmd VimResized * wincmd =

" Applies syntax highlighting to buck TARGETS files
augroup targets
  au!
  autocmd BufNewFile,BufRead TARGETS   set syntax=python
augroup END

" Opens up netrw in currect directory if you don't specify a file
" augroup ProjectDrawer
"     autocmd!
"     autocmd VimEnter * if argc() == 0 | Explore! | endif
" augroup END

" Allow netrw to remove directories even if they have files in them
let g:netrw_localrmdir='rm -r'
