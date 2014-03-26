set nocompatible

" Auto-Install Vundle if needed (from http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/)
" Setting up Vundle - the vim plugin bundler
filetype off
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
"Add your bundles here

" Autocompletion
Bundle 'ervandew/supertab'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'Shougo/neocomplcache.vim'

" Bookmarks
Bundle 'kshenoy/vim-signature'

" Browsers
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'

" Colors
Bundle 'tomasr/molokai'

" Debugging
Bundle 'joonty/vdebug'

" Searching
Bundle 'kien/ctrlp.vim.git'
Bundle 'rking/ag.vim'

" Status bar plugins
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'majutsushi/tagbar'

" Tools
Bundle 'scrooloose/Syntastic'
Bundle 'tpope/vim-fugitive'

" Java
Bundle 'tpope/vim-classpath'
Bundle 'adragomir/javacomplete'

" Python
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'
Bundle 'vim-scripts/python_match.vim'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

" ======  STANDARD VIM FLAGS ======
syntax on
set colorcolumn=100
set expandtab
set fillchars+=vert:\ ,
set incsearch
set laststatus=2      " causes status bar to be shown by default
set number
set ruler
set shiftwidth=4
set showcmd
"set showtabline=0
set tabstop=4
set title

"
" FOLDING OPTIONS
"
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

autocmd Syntax c,cpp,java,vim,xml,html,xhtml,python,perl setlocal foldmethod=syntax
autocmd Syntax python setlocal foldmethod=indent | setlocal foldlevel=0 | setlocal foldnestmax=1

set foldlevel=1
set foldnestmax=2

" ====== KEY BINDINGS ======
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :TlistToggle<CR>

" Command-line mappings
cnoremap <C-a> <Home>
cnoremap <C-d> <Del>

" Normal mode mappings
nnoremap <silent> <Tab> :bn<cr>
nnoremap <silent> <S-Tab> :bp<cr>
nnoremap <silent> <Leader>1 :b1<cr>
nnoremap <silent> <Leader>2 :b2<cr>
nnoremap <silent> <Leader>3 :b3<cr>
nnoremap <silent> <Leader>4 :b4<cr>
nnoremap <silent> <Leader>5 :b5<cr>
nnoremap <silent> <Leader>6 :b6<cr>
nnoremap <silent> <Leader>7 :b7<cr>
nnoremap <silent> <Leader>8 :b8<cr>
nnoremap <silent> <Leader>9 :b#<cr>

" ====== OMNICOMPLETION ======

set omnifunc=syntaxcomplete#Complete

" Update autocompletion text when using Up/Down keys in menu
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" ====== AUTOLOAD FILETYPE ======
filetype plugin on

au BufRead,BufNewFile *.json    set filetype=js
au BufRead,BufNewFile *.js      set filetype=js
au BufRead,BufNewFile *.events  set filetype=events
au BufRead,BufNewFile *.inc     set filetype=apache

au FileType events command Pretty execute ".!python -m json.tool"
au FileType events nmap = :Pretty<CR>
au FileType js command Pretty execute "%!python -m json.tool"
au FileType js nmap = :Pretty<CR>

" Use javacomplete for omnicompletion
au FileType java setlocal omnifunc=javacomplete#Complete

" Use vim-classpath to detect the classpath, and feed the result to javacomplete
au FileType java let b:classpath=substitute(classpath#detect(), ",", ":", "g")

" ====== COLORS ======

colorscheme molokai
hi Folded ctermbg=234 ctermfg=blue
hi Pmenu ctermfg=236 ctermbg=251
hi PmenuSel ctermfg=white ctermbg=21
hi PmenuSbar ctermbg=247
hi PmenuThumb ctermfg=236

" ====== PLUGIN OPTIONS ======

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '►'
let g:airline_right_sep = '◀︎'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme = 'murmur'

let g:ctrlp_root_markers = ['.git']    " project root markers
let g:easytags_auto_update = 1
let g:neocomplcache_enable_at_startup = 1
let g:pymode_lint_ignore = "E501"      " ignore line-too-long erros
let g:pymode_rope_vim_completion = 0   " disable autocompletion (necessary to use jedi-vim)
let g:Tlist_Process_File_Always = 1    " process tags even when taglist is closed
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 35

" Avoid airline bug with completion menu disappearing.
" See https://github.com/bling/vim-airline/issues/78
let g:jedi#auto_vim_configuration = 0
set completeopt-=preview
