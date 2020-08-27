" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'        " Distraction-free mode
Plug 'itchyny/vim-cursorword'   " Fancy underlines
Plug 'tpope/vim-fugitive'       " Noice git stuff
Plug 'tpope/vim-commentary'     " For 'debugging'
Plug 'tpope/vim-surround'       " Change surrounding characters
Plug 'tmsvg/pear-tree'          " Make pairs of brackets, etc.
Plug 'morhetz/gruvbox'          " Colorscheme
Plug 'airblade/vim-gitgutter'   " See file changes
Plug 'vim-airline/vim-airline'  " Fancy bar
Plug 'vim-airline/vim-airline-themes' " Fancy bar themes
Plug 'dag/vim-fish'             " Syntax highlighting for .fish files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completion, etc.
Plug 'vimwiki/vimwiki'          " Notes
" TODO: get better css color plugin
"Plug 'skammer/vim-css-color'    " See color of hex codes
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
" Disable Ex mode
nnoremap Q <Nop>
" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Make tags
command! MakeTags !ctags -R .
" Easier search navigation
nnoremap n nzz
nnoremap N Nzz
set nohlsearch

" MISC
set autoindent
set path+=**
set wildmenu
set splitbelow splitright
set number
set relativenumber
set nowrap
set tabstop=8
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
set shortmess+=c
set signcolumn=yes

" GOYO
noremap <C-g> :Goyo<CR>

" VIMWIKI
let g:vimwiki_list = [{'path': '~/media/documents/vimwiki'}]

" AIRLINE
let g:airline_theme = 'gruvbox'
let g:airline_symbols_ascii = 1
let g:airline_section_z = '%l:%c %p%%'
let g:airline_extensions = []

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
" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" <CR> to confirm completion
if exists('*complete_info')
    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    else
	call CocAction('doHover')
    endif
endfunction
" Jump to error
nnoremap <leader>ge :lnext<CR>
" Symbol renaming
nnoremap <silent> <leader>rn <Plug>(coc-rename)
" Code navigation
nnoremap <silent> <leader>gd <Plug>(coc-definition)
nnoremap <silent> <leader>gy <Plug>(coc-type-definition)
nnoremap <silent> <leader>gi <Plug>(coc-implementation)
nnoremap <silent> <leader>gr <Plug>(coc-references)
" Use <C-s> for trigger snippet expand.
inoremap <silent> <C-s> <Plug>(coc-snippets-expand)
