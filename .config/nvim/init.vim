"PLUGINS
call plug#begin('~/.vim/plugged')
"Plug 'itchyny/lightline.vim'	"Fancy bottom bar
Plug 'itchyny/vim-cursorword'	"Fancy underlines
"Plug 'scrooloose/nerdtree'	"Fancy file explorer
Plug 'joshdick/onedark.vim' 	"Fancy C O L O R S
Plug 'tpope/vim-fugitive' 	"Noice git stuff
Plug 'tpope/vim-commentary'     "For 'debugging'
Plug 'tpope/vim-surround'	"Gud
Plug 'tmsvg/pear-tree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'dag/vim-fish'
call plug#end()

" REMAPS
"For when you type too quickly
cnoremap Wq<CR> wq<CR>
cnoremap W<CR> w<CR>
cnoremap Q<CR> q<CR>

"Ex mode is icky
nnoremap Q <Nop>
"Simple snippet stuff
nnoremap ,{ a<Space>{<Enter>}<Esc>ko
nnoremap ,( a()<Esc>
nnoremap ,[ a[]<Esc>
"Toggle numbers
nnoremap <C-n> :set nonumber! norelativenumber!<CR>
"Quick stuff
cnoremap E<CR> e<CR>
"Make dem tags
command! MakeTags !ctags -R .


" SETS
set path+=**
set wildmenu
set number
set relativenumber
set nowrap
set shiftwidth=4
set cursorline
set showcmd
set noshowmode
set encoding=UTF-8
set updatetime=25
filetype plugin indent on

"c o l o r s
"let g:lightline = {'colorscheme': 'onedark', 'separator': {'left': '', 'right': ''}}
"let g:onedark_termcolors = 16
let g:gruvbox_italic = 1
"let g:gruvbox_termcolors=16
let g:airline_theme = 'gruvbox'
colorscheme gruvbox
syntax on

" open tree with no files or with dir
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" kill nerd if only left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nerd gitt
" let g:NERDTreeShowIgnoredStatus = 1
