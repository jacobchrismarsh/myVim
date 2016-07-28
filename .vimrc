set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set ruler                                   " Shows position of cursor.
set autoindent                              " Automatically indents.
set backspace=indent,eol,start
" set smarttab
syntax enable
colorscheme ron
" color koehler                               " Sets a nice color.


set cc=81                                   " Creates an 80 character line to show my where to stop. 
highlight ColorColumn ctermbg=7

let &t_Co=256                               " Enables 256 color support on VIm

set mouse=a                                 "Enable mouse use.

"highlight any text that goes past 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/



" Commenting blocks of code
autocmd FileType c,cpp,java,scale let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Shortcut to make moving splits easier
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H> 

" Maps the escape button to jj 
imap jk <Esc>
