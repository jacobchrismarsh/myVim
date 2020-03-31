"=====================SHORTCUTS================================================

" This shortcut will immediately open this vimrc in a vertical split
nnoremap vv :vs<space>~/myVim/.vimrc<CR>


" This allows you to repeat a macro by pressing <leader><Enter> instead of '@@'
nnoremap <silent> <leader><CR> :call ReplayLastMacro()<cr>
function! ReplayLastMacro()
    try
        normal @@
    catch /E748/
        normal @q
    endtry
endfunction
