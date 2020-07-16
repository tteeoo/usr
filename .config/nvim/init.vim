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
Plug 'skammer/vim-css-color' " See color of hex codes
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
" Make tags
command! MakeTags !ctags -R .

" MISC
set path+=**
set wildmenu
set number
set relativenumber
set nowrap
set shiftwidth=8
set listchars=tab:\|\ 
set list
set cursorline
set showcmd
set noshowmode
set encoding=UTF-8
set updatetime=50
let mapleader = ','
" coc specific
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

" VIMWIKI
let g:vimwiki_list = [{'path': '~/media/vimwiki'}]

" AIRLINE
let g:airline_theme = 'gruvbox'
let g:airline_symbols_ascii = 1
let g:airline_section_z = '%l:%c %p%%'

" COLORS
syntax on
let g:gruvbox_italic = 1
" let g:gruvbox_termcolors=16
colorscheme gruvbox

" COC.NVIM
" Abort completion on backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Symbol renaming
nmap ,rn <Plug>(coc-rename)
" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <CR> to confirm completion
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Code navigation
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
" Use <C-s> for trigger snippet expand.
imap <C-s> <Plug>(coc-snippets-expand)
" Jump to error
nnoremap ,ge :lnext<CR>
