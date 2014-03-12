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

" Tab completion
Bundle 'ervandew/supertab'

" Visible bookmarks
Bundle 'kshenoy/vim-signature'

" NERDTree file browser
Bundle 'scrooloose/nerdtree'

" Automatic syntax checking
Bundle 'scrooloose/Syntastic'

Bundle 'taglist.vim'
Bundle 'vim-scripts/autotag'

" Molokai color scheme
Bundle 'tomasr/molokai'

" Git integration
Bundle 'tpope/vim-fugitive'

" Fancy status bar
Bundle 'bling/vim-airline'

" Adds git info to fancy status bar
Bundle 'airblade/vim-gitgutter'

" Virtualenv support
Bundle 'jmcantrell/vim-virtualenv'

" Adds current function to status bar
Bundle 'majutsushi/tagbar'

" Quick filename matching
Bundle 'kien/ctrlp.vim.git'

" Silver Searcher (Ag) support
Bundle 'rking/ag.vim'

" Python-related bundles
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'

" Debugging
Bundle 'joonty/vdebug'

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

autocmd Syntax c,cpp,vim,xml,html,xhtml,python,perl setlocal foldmethod=syntax
autocmd Syntax python setlocal foldmethod=indent | setlocal foldlevel=0 | setlocal foldnestmax=1

set foldlevel=1
set foldnestmax=2

" ====== KEY BINDINGS ======
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>

" ====== OMNICOMPLETION ======
"set omnifunc=syntaxcomplete#Complete

" Update autocompletion text when using Up/Down keys in menu
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" ====== AUTOLOAD FILETYPE ======
filetype plugin on

" JSON and Javascript customizations
au BufRead,BufNewFile *.json    set filetype=js
au BufRead,BufNewFile *.js      set filetype=js
au BufRead,BufNewFile *.events  set filetype=events
au BufRead,BufNewFile *.inc     set filetype=apache
au FileType events command Pretty execute ".!python -m json.tool"
au FileType events nmap = :Pretty<CR>
au FileType js command Pretty execute "%!python -m json.tool"
au FileType js nmap = :Pretty<CR>

" ====== COLORS ======

colorscheme molokai
hi Folded ctermbg=234 ctermfg=blue
hi Pmenu ctermfg=236 ctermbg=251
hi PmenuSel ctermfg=white ctermbg=21
hi PmenuSbar ctermbg=247
hi PmenuThumb ctermfg=236

" ====== PLUGIN OPTIONS ======

let g:ctrlp_root_markers = ['.git']    " project root markers
let g:pymode_lint_ignore = "E501"      " ignore line-too-long erros
let g:pymode_rope_vim_completion = 0   " disable autocompletion (necessary to use jedi-vim)
let Tlist_Process_File_Always = 1      " process tags even when taglist is closed
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'murmur'

" Avoid airline bug with completion menu disappearing.
" See https://github.com/bling/vim-airline/issues/78
let g:jedi#auto_vim_configuration = 0
set completeopt-=preview
