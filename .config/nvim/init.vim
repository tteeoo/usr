" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-cursorword'	" Fancy underlines
Plug 'tpope/vim-fugitive' 	" Noice git stuff
Plug 'tpope/vim-commentary'     " For 'debugging'
Plug 'tpope/vim-surround'	" Very handy
Plug 'tmsvg/pear-tree'		" Very handy
Plug 'morhetz/gruvbox'		" Colorscheme
Plug 'airblade/vim-gitgutter'	" See file changes
Plug 'vim-airline/vim-airline'	" Fancy bar
Plug 'vim-airline/vim-airline-themes' " Fancy bars
Plug 'dag/vim-fish'		" Colors for .fish files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion
Plug 'vimwiki/vimwiki' " Notes
call plug#end()
" :CocInstall
" 	coc-go
" 	coc-css
" 	coc-html
" 	coc-json
" 	coc-python
" 	coc-prettier
" 	coc-snippets

" REMAPS
" For when you type too quickly
cnoremap Wq<CR> wq<CR>
cnoremap W<CR> w<CR>
cnoremap Q<CR> q<CR>
" Ex mode is icky
nnoremap Q <Nop>
" Quick stuff
cnoremap E<CR> e<CR>
cnoremap f<Space> find<Space>
" Make tags
command! MakeTags !ctags -R .
" Coc specific
" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <C-Space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" <CR> to confirm completion
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    else
	call CocAction('doHover')
    endif
endfunction
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" SET
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
set updatetime=50
" coc specific
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

" VIMWIKI
let mapleader = ','
let g:vimwiki_list = [{'path': '~/media/vimwiki'}]

" COLORS
syntax on
filetype plugin indent on
let g:gruvbox_italic = 1
"let g:gruvbox_termcolors=16
let g:airline_theme = 'gruvbox'
colorscheme gruvbox

" COC
" Abort completion on backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Symbol renaming.
nmap ,rn <Plug>(coc-rename)
" Formatting selected code.
xmap ,f  <Plug>(coc-format-selected)
nmap ,f  <Plug>(coc-format-selected)
