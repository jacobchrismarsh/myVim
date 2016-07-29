"======================BASIC VIM SETTINGS======================================

" Enables a bunch of cool features. Normally gets enabled by default, but I
" set it here to ensure it gets turned on. Better safe than sorry.
set nocompatible

" Shows line numbers
set number

" Some plugins mess with indentation, and this fixes that issue
filetype plugin indent on

"Makes one tab character be 4 columns wide
set tabstop=4

" Controls how many columns text gets indented when you use > and <
set shiftwidth=4

" Converts tabs to spaces
set expandtab

" Shows position of cursor
set ruler

" Automatically indents new lines
set autoindent

" Makes backspace actually intelligent
set backspace=indent,eol,start

" Enable mouse use.
set mouse=a

" Shows 5 lines above and below cursor at all times
set scrolloff=5

" Highlight things as you search for them
set incsearch

" Shows commands, like 23dd, as you type them
set showcmd

" Forces VIm to always show the status line
set laststatus=2

" Formats the status line really nicely
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ 

j
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "+y
set clipboard=unnamed
"======================COLORS==================================================

" Enables syntax highlighting
syntax enable

" My preferred colorcheme
colorscheme jellybeans

" Creates an 80 character line to show me where to stop.
set cc=81

" Makes that 80 character line black
highlight ColorColumn ctermbg=7

" Highlights the line that the cursor is on
set cursorline

" Enables 256 color support on VIm
let &t_Co=256

"=====================KEY REMAPPINGS===========================================

" Remap to make moving splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maps the escape button to jk
inoremap jk <Esc>

" Allows you to use the semi-colon in place of the colon in normal mode
nnoremap ; :

" The cursor now moves how you would expect it to with wrapped lines
map j gj
map k gk

" In normal mode, space and ctrl-space will search forwards/backward
" (For some reason, terminal and VIm interpret Ctrl-Space as Ctrl-@)
map <space> /
map <C-Space> ?
map <C-@> <C-Space>

" If you press F5, this will delete all trailing white space at end of lines
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Binds the left/right arrow keys to move left/right through tabs.
" This might be weird if you're not used to hjkl navigation in VIm.
nnoremap <Left> gT
nnoremap <Right> gt


"=====================SHORTCUTS================================================

" Commenting blocks of code (',cc' to comment and ',cu' to uncomment)
autocmd FileType c,cpp,java,scale let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"=====================ADVANCED VIM SETTINGS====================================

" Prevents VIm from making those annoying backup files
set nu!
set nobackup

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


"=====================HELPER FUNCTIONS=========================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction


