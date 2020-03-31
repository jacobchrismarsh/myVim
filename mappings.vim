"=====================KEY REMAPPINGS===========================================

" Remap to make moving splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Maps the escape button to jk (both upper-case and lower-case)
inoremap jk <Esc>
inoremap jK <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>


" In visual mode, maps the escape button to df (this is because jk moves the
" the cursor around in visual mode).
vnoremap df <Esc>


" Allows you to use the semi-colon in place of the colon in normal mode
nnoremap ; :


" The cursor now moves how you would expect it to with wrapped lines
map j gj
map k gk


" Binds the left/right arrow keys to move between previous/next buffer.
" This might by weird if you're not used to hjkl navigation in Vim.
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>


" Binds the tab/shift-tab keys to move left/right through tabs.
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>gt
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>gT

" Jumps to next/previous errors when you use :make command
nnoremap ]e :cn<CR>
nnoremap [e :cp<CR>


" Sets up vim to support spelling changes. Upon pressing C-l, Vim will
" intelligently fix the most recent spelling error.
" setlocal spell
" set spelllang=nl,en_gb
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

