"======================BASIC VIM SETTINGS======================================

" Enables a bunch of cool features. Normally gets enabled by default, but I
" set it here to ensure it gets turned on. Better safe than sorry.
set nocompatible


" Allows you to open and edit new buffers without saving the current one.
set hidden


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


" Searching is no longer case sensitive
set ignorecase


" If you search for something with a capital letter, it will be case-sensitive
set smartcase


" Shows commands, like 23dd, as you type them
set showcmd


" Forces Vim to always show the status line
set laststatus=2

" When I open a new vertical split, it will show up on the right side
set splitright


" When I open a new horizontal split, it will show up on the bottom
set splitbelow


" Formats the status line really nicely
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ 


"======================COLORS==================================================

" Enables syntax highlighting
syntax enable


" My preferred colorcheme
colorscheme jellybeans


" Creates an 80 character line to show me where to stop.
set colorcolumn=81


" Makes that 80 character line the color grey
highlight ColorColumn ctermbg=7


" Highlights the line that the cursor is on
set cursorline


" Enables 256 color support on Vim
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
" (For some reason, terminal and Vim interpret Ctrl-Space as Ctrl-@)
map <space> /
map <C-Space> ?
map <C-@> <C-Space>


" If you press F5, this will delete all trailing white space at end of lines
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Binds the left/right arrow keys to move left/right through tabs.
" This might be weird if you're not used to hjkl navigation in Vim.
nnoremap <Left> gT
nnoremap <Right> gt


"=====================SHORTCUTS================================================

" Commenting blocks of code (,cc to comment and ,cu to uncomment)
autocmd FileType c,cpp,java,scale let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" This shortcut will close all buffers, but leave Vim open in a new file
map qq :bp<bar>sp<bar>bn<bar>bd<CR>


" This shortcut will immediately open this vimrc in a vertical split
nnoremap vv :vs<space>~/myVim/.vimrc<CR>


autocmd BufEnter *.py nnoremap <F4> :w<space>!python<CR> 
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



"=====================HELPER FUNCTIONS=========================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction


