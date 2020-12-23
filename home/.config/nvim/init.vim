" Theo Henson's Neovim init.vim

" Plugins {{{

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif
" CocInstall coc-go coc-css coc-html coc-json coc-python

call plug#begin('~/.vim/plugged')

" tpope is actually a god
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Make the computer code for you
Plug 'tmsvg/pear-tree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'airblade/vim-gitgutter'

" Appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-cursorword'
Plug 'dag/vim-fish'

" Misc
Plug 'vimwiki/vimwiki'

call plug#end()

" }}}

" General configuration {{{

" General compatibility {{{2
set nocompatible
set encoding=UTF-8
let mapleader = ' '
filetype plugin indent on
" }}}2

" For when you type too quickly {{{2
cnoremap Wq<CR> wq<CR>
cnoremap W<CR> w<CR>
cnoremap Q<CR> q<CR>
noremap Q <Nop>
" }}}2

" Folds {{{2
set foldmethod=marker
" }}}2 

" Splits/Buffers {{{2
set splitbelow splitright
noremap <C-s> :split<CR>
noremap <C-v> :vsplit<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Not sure what to bind these to:
" noremap <Space>h :vertical resize -5<CR>
" noremap <Space>l :vertical resize +5<CR>
" noremap <Space>k :resize -5<CR>
" noremap <Space>j :resize +5<CR>
noremap <C-c> <C-w>q
noremap <C-d> :bdelete<CR>
noremap <Leader>, :bprevious<CR>
noremap <Leader>. :bnext<CR>
" }}}2 

" Tabs {{{2
noremap <A-TAB> :tabnext<CR>
noremap <A-t> :tabnew<CR>
noremap <A-c> :tabclose<CR> 
" }}}2 

" Easier in-file navigation {{{2
set nohlsearch
set ignorecase
nnoremap n nzz
nnoremap N Nzz
nnoremap S :%s//g<Left><Left>
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" }}}2 

" Make tags command {{{2
command! MakeTags !ctags -R .
" }}}2 

" Fuzzy file search {{{2
noremap <C-f> :find 
set path=**
set wildmenu
" }}}2 

" Indentation {{{2
set autoindent
set tabstop=8
set list
set listchars=tab:\|\ 
" }}}2 

" Line behaviour {{{2
set nowrap
set number
set cursorline
set relativenumber
" }}}2 

" Coc compatibility {{{2
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set signcolumn=yes
" }}}2 

" Vim wiki {{{2
let g:vimwiki_list = [{'path': '~/docs/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
" }}}2

" Git fugitive {{{2
cnorea <expr> g getcmdpos() == 2 ? 'Git' : 'g'
cnorea <expr> gch getcmdpos() == 4 ? 'Git checkout' : 'gch'
cnorea <expr> gc getcmdpos() == 3 ? 'Git commit -S' : 'gc'
cnorea <expr> gs getcmdpos() == 3 ? 'Git status' : 'gs'
cnorea <expr> gd getcmdpos() == 3 ? 'Git diff' : 'gd'
cnorea <expr> gb getcmdpos() == 3 ? 'Git branch' : 'gb'
cnorea <expr> ga getcmdpos() == 3 ? 'Git add' : 'ga'
cnorea <expr> gp getcmdpos() == 3 ? 'Git pull' : 'gp'
cnorea <expr> gch getcmdpos() == 4 ? 'Git checkout' : 'gch'
cnorea <expr> gpsh getcmdpos() == 5 ? 'Git push' : 'gpsh'
cnorea <expr> gbpsh getcmdpos() == 6 ? 'Git push --set-upstream origin' : 'gbpsh'
" }}}2

" Status line {{{2
set showcmd
set noshowmode
set updatetime=50
let g:airline_theme = 'gruvbox'
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = '%l:%c %p%%'
let g:airline_extensions = ['tabline', 'branch', 'hunks']
" }}}2 

" Color scheme {{{2
syntax on
let g:gruvbox_italic = 1
colorscheme gruvbox
if (has("termguicolors"))
	set termguicolors
endif
" }}}2

" }}}

" Coc configuration {{{

" Completion functionality 2{{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <C-space> coc#refresh()
else
	inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
" }}}2

" Keybindings 2{{{
" Use `[g` and `]g` to navigate errors
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming
nmap <silent> <Leader>rn <Plug>(coc-rename)
" Code navigation
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)
" }}}2

" }}}
