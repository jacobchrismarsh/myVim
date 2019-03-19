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


"Makes one tab character be 3 columns wide
set tabstop=4

"Makes one tab character be 3 columns wide
set softtabstop=4

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

" Lets vim know its the 21st century and terminals can draw fast now
set ttyfast

let mapleader = " "


" When your terminal is too wide, vim doesn't recognize mouse-clicks past the
" 220th column. This fixes that. Only works on >7.3.632, or vim compiled with
" mouse_sgr
set ttymouse=sgr


" Formats the status line really nicely
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\

" These three lines prevent Vim from putting a new line character at the end
" of a file
" set noeol
" au BufWritePre * set binary | set noeol
" au BufWritePost * set nobinary | set eol

"======================COLORS==================================================

" Enables syntax highlighting
syntax enable


" My preferred colorcheme
colorscheme jellybeans


" Creates an 80 character line to show me where to stop.
set colorcolumn=89


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


" Maps the escape button to jk (both upper-case and lower-case)
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>


" In visual mode, maps the escape button to df (this is because jk moves the
" the cursor around in visual mode).
vnoremap df <Esc>


" Allows you to use the semi-colon in place of the colon in normal mode
nnoremap ; :


" The cursor now moves how you would expect it to with wrapped lines
map j gj
map k gk


" March 10, 2019 - I dont think I need this anymore. Space is more valuable as a leader
" In normal mode, space and ctrl-space will search forwards/backward
" (For some reason, terminal and Vim interpret Ctrl-Space as Ctrl-@)
" map <space> /
" map <C-Space> ?
" map <C-@> <C-Space>


" If you press F5, this will delete all trailing white space at end of lines
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Compiles all java files in whichever directory you are in
nnoremap <F2> :!clear && javac *.java<CR>

" Compiles all C files in whichever directory you are in
nnoremap <F3> :!clear && gcc *.c && gcc *.h<CR>


" Binds the left/right arrow keys to move between previous/next buffer.
" This might by weird if you're not used to hjkl navigation in Vim.
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>


" Binds the Ctrl-left/Ctrl-right arrow keys to move left/right through tabs.
" This might be weird if you're not used to hjkl navigation in Vim.
nnoremap <C-Left> gT
nnoremap <C-Right> gt


"=====================SHORTCUTS================================================

" This shortcut will immediately open this vimrc in a vertical split
nnoremap vv :vs<space>~/myVim/.vimrc<CR>


" An attempt at setting F4 to execute a python script. Still needs work
" autocmd BufEnter *.py nnoremap <F4> :w<space>!python<CR>

" This allows you to repeat a macro by pressing <Enter> instead of '@@'
nnoremap <silent> <cr> :call ReplayLastMacro()<cr>
function! ReplayLastMacro()
    try
        normal @@
    catch /E748/
        normal @q
    endtry
endfunction
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

"=====================HELPER FUNCTIONS=========================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

"=====================VUNDLE SET UP============================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


"" VIM COMMENTARY
Plugin 'tpope/vim-commentary'


"" NERD TREE
Plugin 'scrooloose/nerdtree'
" autocmd vimenter * NERDTree "automatically opens nerdtree when opening vim

autocmd StdinReadPre * let s:std_in=1 "Open up nerdtree if no files are specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <Leader>f :NERDTreeFocus<Enter>
nnoremap <Leader>c :NERDTreeClose<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"" EASY MOTION
Plugin 'easymotion/vim-easymotion'
" By default, <leader><leader> is the prefix. This conflicts with my binding
" for FZF, so I disable the easymotion prefix here. Other commands still work
" if specified with a `map`
map <nop> <Plug>(easymotion-prefix) 
" Replaces normal search with easymotion-search, highlights next/previous
" occurences when pressing n or N
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  f <Plug>(easymotion-fl)
map  F <Plug>(easymotion-bd-fl)
map  t <Plug>(easymotion-tl)
map  T <Plug>(easymotion-bd-tl)
" More easymotion, but this time with the <leader>hjkl keys
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Remaps 's' from default function to two-char search
nmap <Leader>s <Plug>(easymotion-s2)

" Replicates the smartcase option of Vim
let g:EasyMotion_smartcase = 1


"" FZF.VIM <3
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] 
  \ }
" Space-space will open FZF for CWD
nnoremap <leader><leader> :Files<CR>
" Space-dash will open FZF for directory of currently used file
nnoremap <silent> <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>
" Space-b will search through active buffers
nnoremap <silent> <leader>b :Buffers<CR>
" Space-l will search through lines of all active buffers
nnoremap <silent> <leader>n :Lines<CR>



"" LIGHTLINE
Plugin 'itchyny/lightline.vim'
" let g:lightline = {
"             \ 'colorscheme': 'jellybeans',
"             \ 'component_function': {
"             \   'gitbranch': 'fugitive#head'
"             \ }
"             \ }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename'
      \ },
      \ }
" Lightline will display full pathname of file relative to git project root
function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction


"" VIM-SURROUND: Allows for easy surrounding of words and lines with "([{...
"" How-To: http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/
Plugin 'tpope/vim-surround'


"" EASY-ALIGN: activate with ga<key to align around>, like =
Plugin 'junegunn/vim-easy-align'
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)


"" TEXT OBJEXTS
" Allows me to add custom text objext to vim
Plugin 'kana/vim-textobj-user'
" Adds more line objects that don't include new-line at the end of the line
" vil will select from cursor to end of line
" val will select entire line
" both of these will NOT select the newline char at the end of a line
Plugin 'kana/vim-textobj-line'


"" THRIFT FILE SYNTAX HIGHLIGHTING
Bundle 'solarnz/thrift.vim'


"" VIM-REPEAT: Allows you to repeat the most recent plugin command
Plugin 'tpope/vim-repeat'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


"" COMFORTABLE-MOTION:  Adds more physics to vim to make C-d and C-u scrolling palatable
Plugin 'yuttie/comfortable-motion.vim'


"" VIM FUGITIVE - nice git wrapper
Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>g :Gstatus<CR>
nnoremap <silent> <leader>v :vertical Gstatus<CR>
nnoremap <silent> <leader>c :Gcommit<CR>


"" VIM SIGNIFY - shows git additions, deletions, and modifications in left sidebar
Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_change = '~'
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


"" VIM SLEUTH - auto-detects the tabbing and spacing setup for a file
Plugin 'tpope/vim-sleuth'


"============================ CONDITIONAL PLUGINS ===============================

" Only load Black if Vim compiled with Python3
if has('python3')
  "" The best python code formatter. :Black or <leader>= to use
  Plugin 'ambv/black'
  nnoremap <Leader>= :Black<CR>
endif


" Only load these plugins if you have Vim 8 or above
if v:version >= 800
  "" Auto-complete that uses machine learning
  Plugin 'zxqfl/tabnine-vim'
  

  "" ALE async linting 
  Plugin 'w0rp/ale'
  let g:ale_linters = {"python" : ["black"],}
  " Fix Python files with autopep8 and yapf.
  let g:ale_fixers = ['autopep8', 'yapf']
  " Disable warnings about trailing whitespace for Python files.
  let g:ale_warn_about_trailing_whitespace = 0
  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  " " You can disable this option too if you don't want linters to run on opening a file
  let g:ale_lint_on_enter = 0
endif

call vundle#end()
filetype plugin indent on
