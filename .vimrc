"======================BASIC VIM SETTINGS======================================
set nocompatible
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set ruler                              " Shows position of cursor.
set autoindent                         " Automatically indents.
set backspace=indent,eol,start
" set smarttab
set mouse=a                            " Enable mouse use.
set scrolloff=5                        " Keeys 5 lines above and below cursor at all times
set incsearch                          " Highlight things as you search for them
set showcmd                            " Shows commands, like 23dd, as you type them
"======================COLORS==================================================
syntax enable
colorscheme jellybeans

set cc=81                              " Creates an 80 character line to show me where to stop. 
highlight ColorColumn ctermbg=7

set cul                                " Highlights current line

let &t_Co=256                          " Enables 256 color support on VIm

"=====================KEY REMAPPINGS===========================================
" Remap to make moving splits easier
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H> 

" Maps the escape button to jk 
imap jk <Esc>

" Allows you to use the semi-colon in place of the colon in normal mode
nore ; :

" The cursor now moves how you would expect it to with wrapped lines
nore j gj
nore k gk

"=====================SHORTCUTS================================================
" Commenting blocks of code
autocmd FileType c,cpp,java,scale let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"=====================ADVANCED VIM SETTINGS====================================
" Prevents VIm from making those annoying backup files
set nu!
set nobackup
