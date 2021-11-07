" =========================
" ~/.vimrc
" =========================

" == General ==
syntax on
filetype on
filetype plugin on
filetype plugin indent on

set encoding=UTF-8
set nu
set autoindent
set shiftwidth=2
set tabstop=2
set noexpandtab
set smarttab
set mouse=a
set showcmd
set nocompatible
set hlsearch
set incsearch
set splitbelow
set splitright
set cursorline
set omnifunc=syntaxcomplete#Complete
"set termguicolors " Conflicts with tmux
set term=xterm-256color " Work with tmux

map <F7> :tabp <CR>
map <F8> :tabn <CR>
map <C-l> :nohl<CR>
map <F9> :e#<CR>
:nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>
" =========================

" == VIM PLUG ==
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'

" Always load the vim-devicons as the very last one
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
" =========================

" == NerdTree plugin
map <F2> :NERDTreeToggle<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" =========================

" == Airline plugin ==
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
"let g:airline_theme='dracula'
" =========================

"== Dracula Theme ==
"colorscheme dracula
"let g:dracula_italic = 1
"highlight Normal ctermbg=None
" =========================

" ==  Nord theme ==
let g:nord_italic_comments = 1
colorscheme nord
" =========================

" == Syntastic plugin ==
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" =========================
