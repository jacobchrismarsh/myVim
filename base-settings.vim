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
set smartindent


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


" Set the leader key to <Space>
let mapleader = " "


" When your terminal is too wide, vim doesn't recognize mouse-clicks past the
" 220th column. This fixes that. Only works on >7.3.632, or vim compiled with
" mouse_sgr
set ttymouse=sgr


" These three lines prevent Vim from putting a new line character at the end
" of a file
" set noeol
" au BufWritePre * set binary | set noeol
" au BufWritePost * set nobinary | set eol


set tags=tags;/
