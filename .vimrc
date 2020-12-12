set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'dracula/vim'
Plugin 'lsdr/monokai'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'jnurmine/Zenburn'
Bundle 'troydm/easybuffer.vim'
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ivanov/vim-ipython'
Plugin 'benmills/vimux'
Plugin 'julienr/vim-cellmode'
Plugin 'lrvick/Conque-Shell'
Plugin 'jeetsukumaran/vim-buffergator'

syntax on

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

if has('gui_running')
    set background=dark
    colorscheme dracula
else
    colorscheme zenburn
endif

colorscheme dracula

set encoding=utf-8
set number
set numberwidth=3
set cpoptions+=n
set backspace=2 
fixdel

let python_highlight_all=1

let g:SimpylFold_docstring_preview=1

au GUIEnter * simalt ~x

if has("gui_running")
"    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path="/home/kapil/anaconda2/bin/python"
map <C-q>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:cellmode_tmux_sessionname='python' 
let g:cellmode_tmux_windowname='jupyter-console'
let g:cellmode_tmux_panenumber='0'

noremap <silent> <C-a> :call RunTmuxPythonAllCellsAbove()<CR>

set autoread

set clipboard+=unnamedplus
