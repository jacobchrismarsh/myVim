"=====================VUNDLE SET UP============================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'tpope/vim-commentary' " VIM COMMENTARY
Plugin 'easymotion/vim-easymotion' " EASY MOTION

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
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Remaps 's' from default function to two-char search
nmap <Leader>s <Plug>(easymotion-s2)
"Replicates the smartcase option of Vim
let g:EasyMotion_smartcase = 1


"" FZF.VIM <3
set rtp+=~/.fzf
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
nnoremap <leader>- :Files <C-r>=expand("%:h")<CR>/<CR>
" Space-b will search through active buffers
nnoremap <silent> <leader>b :Buffers<CR>
" Space-l will search through lines of all active buffers
nnoremap <silent> <leader>n :Lines<CR>


"" LIGHTLINE
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \         ['lineinfo'],
      \         ['percent'],
      \         ['filetype'],
      \     ]
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


"" TEXT OBJEXTS
" Allows me to add custom text objext to vim
Plugin 'kana/vim-textobj-user'
" Adds more line objects that don't include new-line at the end of the line
" vil will select from cursor to end of line
" val will select entire line
" both of these will NOT select the newline char at the end of a line
Plugin 'kana/vim-textobj-line'

"" THRIFT FILE SYNTAX HIGHLIGHTING
Plugin 'solarnz/thrift.vim'

"" VIM-REPEAT: Allows you to repeat the most recent plugin command
Plugin 'tpope/vim-repeat'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"" VIM FUGITIVE - nice git wrapper
Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <leader>v :vertical Git<CR>
nnoremap <silent> <leader>d :Gdiff<CR>

"" VIM SIGNIFY - shows git additions, deletions, and modifications in left sidebar
Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_change = '~'
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
let g:signify_realtime = 1 " Signify updates more often
let g:signify_cursorhold_insert = 0 "Signify won't take me out of insert-mode to update
let g:signify_cursorhold_normal = 0

"" VIM SLEUTH - auto-detects the tabbing and spacing setup for a file
Plugin 'tpope/vim-sleuth'

"" VIM VINEGAR - better netrw controls
Plugin 'tpope/vim-vinegar'
let g:netrw_fastbrowse = 0 " Prevent vinegar from keeping useless netrw buffers 

"" VIM-MACRO-REPEAT - Allows you to repeat a macro using just '.' 
Plugin 'jacobchrismarsh/vim-macro-repeat'

"" VIM-YANKSTACK. Keeps a stack of all yanks that you can traverse
Plugin 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"" VIM-SURROUND: Allows for easy surrounding of words and lines with "([{...
"" How-To: http://www.futurile.net/2016/03/19/vim-surround-plugin-tutorial/
Plugin 'tpope/vim-surround'

" Syntax highlighting for hack files
Plugin 'hhvm/vim-hack'

" Easily switch between header files and source files 
Plugin 'ericcurtin/CurtineIncSw.vim'
nmap <leader>1 :call CurtineIncSw()<CR>

" Omit the final newline of a file if it wasn't present when we opened it
Plugin 'vim-scripts/PreserveNoEOL'

" Rust Development 
Plugin 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Makes it easy to switch two things, using 'cx'
Plugin 'tommcdo/vim-exchange'

Plugin 'vim-python/python-syntax' " Better python syntax highlighting
let g:python_highlight_all = 1

Plugin 'bfrg/vim-cpp-modern' " Better cpp syntax highlighting

"============================ CONDITIONAL PLUGINS ===============================

" Only load Black if Vim compiled with Python3 and you have >Python3.6
" installed
" let python_version = system('python3 --version')
" let python_version_number = split(python_version)[1]
" if has('python3') && str2float(python_version_number[0:2]) > 3.6
"   "" The best python code formatter. :Black or <leader>= to use
"   Plugin 'ambv/black'
"   nnoremap <Leader>= :Black<CR>
"   let g:black_virtualenv="~/virtualenvs/black-plugin-support/lib/python3.6/site-packages/"
" endif


" Only load these plugins if you have Vim 8 or above
if v:version >= 800
  "" Auto-complete that uses machine learning
  Plugin 'zxqfl/tabnine-vim'
  

  "" ALE async linting 
  " Plugin 'dense-analysis/ale'
  " let g:ale_linters = {"python": ["flake8"], "cpp": ["cquery_buck"]}
  " Fix Python files with black and isort.
  " let g:ale_fixers = {"python": ["black"]}
  " let g:ale_fix_on_save = 1
  " Disable warnings about trailing whitespace for Python files.
  " let g:ale_warn_about_trailing_whitespace = 0
  " Write this in your vimrc file
  " let g:ale_lint_on_text_changed = "never"
  " " You can disable this option too if you don't want linters to run on opening a file
  " let g:ale_lint_on_enter = 0

  " let g:ale_completion_enabled = 1
  " nnoremap <silent> K :ALEHover<CR>
  " nnoremap <silent> gd :ALEGoToDefinition<CR>
  " noremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>
endif

if isdirectory('~/fbsource/')
    source ~/myVim/fb-plugins.vim
endif

call vundle#end()
filetype plugin indent on

