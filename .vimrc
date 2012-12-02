set nocompatible

let mapleader=','
let localmapleader='\'

" terminal {{{
set clipboard=unnamed
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set ttyfast
set ttymouse=xterm2
" }}}

" editing {{{
set backspace=indent,eol,start
set cursorline
set hidden
set laststatus=2
set list
set listchars=""
set listchars+=tab:›\  
set listchars+=trail:·
set listchars+=extends:…
set listchars+=precedes:…
set nowrap
set number
set numberwidth=1
set ruler
set scrolloff=3
set showmatch
" }}}

" searching {{{
set incsearch
" }}}

" wild {{{
set wildmenu
set wildignorecase
set wildmode=list:longest,list:full
" }}}

" backup {{{
set backup
set history=1024
set undofile

" directories {{{
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
" }}}
" }}}

" mappings {{{
" faster command mode
nmap ; :

" up/down keys to be based on display lines, not physical lines
map j gj
map k gk

" faster exit insert
inoremap jk <Esc>
inoremap kj <Esc>

" make undo and yank consistent
nnoremap U <C-r>
map Y y$

" easier split navigating
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" commonly capitalized commands
cnoremap W w
cnoremap Wq wq
cnoremap Q q

" indenting keeps original selection in visual
vnoremap > >gv
vnoremap < <gv

" use sane regexes
nnoremap / /\v
vnoremap / /\v

" write file without correct permissions when opened
cmap w!! %!sudo tee > /dev/null %

" insert the current directory into a command-line path
cmap <C-p> <C-R>=expand("%:p:h") . "/"<CR>

" leader mappings {{{
" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <leader>=f gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" autoindent pasted blocks
nnoremap <leader>p p`[v`]=
nnoremap <leader>P P`]v`[=

" clean trailing whitespace
map <silent><leader>\ :%s/\s\+$//<CR>:let @/=''<cr>

" toggle highlight search
nmap <leader>/ :set hlsearch! hlsearch?<CR>
" }}}
" }}}


" plugins {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" tools {{{
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-unimpaired'
" }}}

" html {{{
Bundle 'gregsexton/MatchTag'
" }}}

" javascript {{{
Bundle 'pangloss/vim-javascript'
Bundle 'teramako/jscomplete-vim'
" }}}

" ruby {{{
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nelstrom/vim-textobj-rubyblock'
" }}}

" rails {{{
"Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-rails'
" }}}

" colors {{{
Bundle 'w0ng/vim-hybrid'
Bundle 'gorodinskiy/molokai'
Bundle 'jnurmine/Zenburn'
" }}}

filetype plugin indent on
syntax on
" }}}

" plugin settings {{{
"----------------------------
" delimitMate
let g:delimitMate_expand_cr = 1

"----------------------------
" jscomplete
let g:jscomplete_use = ['dom']

"----------------------------
" NERDTree
let NERDTreeChDirMode = 2
let NERDTreeHijackNetrw = 1
let NERDTreeShowBookmarks = 1
let NERDTREEShowHidden = 1

" }}}

" plugin mappings {{{
"----------------------------
" Ack
nmap <leader>a :Ack! 

"----------------------------
" Gundo
map <leader>u :GundoToggle<CR>

"----------------------------
" NERDTree
map <leader>n :NERDTreeToggle<CR>

"----------------------------
" Powerline
let g:Powerline_stl_path_style="filename" " only show filename in statusbar

"----------------------------
" TagBar
map <leader>t :TagbarToggle<CR>
" }}}

" gui {{{
"let g:hybrid_use_Xresources = 1
colorscheme hybrid
" }}}

" autocmds {{{
if has("autocmd")
	augroup vim
		au BufWritePost .vimrc source $MYVIMRC
	augroup END

	augroup filetypes
		au FileType javascript setl omnifunc=jscomplete#CompleteJS
		"au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
	augroup END
endif
" }}}
