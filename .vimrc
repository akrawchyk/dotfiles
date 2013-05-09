set nocompatible

let mapleader=','
let localmapleader='\'

"---- terminal {{{
set shell=/bin/sh
set clipboard=unnamed
set encoding=utf-8
set termencoding=utf-8
set t_Co=256
set ttyfast
set ttymouse=xterm2
set visualbell
"---- }}}

"---- editing {{{
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set complete-=i
set copyindent
set nocursorline
set hidden
set laststatus=2
set list
set listchars=tab:⇥\ ,trail:·,extends:…,precedes:…
set modelines=2
set nowrap
set number
set numberwidth=1
set ruler
set sidescrolloff=3
set scrolloff=3
set shiftround
set shortmess=aoOstT
set showmatch
set smartindent
set smarttab
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=50
"---- }}}

"---- searching {{{
set ignorecase
set incsearch
set smartcase
"---- }}}

"---- complete {{{
set completeopt=menuone,menu,longest
"---- }}}

"---- wild {{{
set wildignore+=*.DS_Store
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildmenu
set wildignorecase
set wildmode=list:longest,list:full
" }}}

"---- backup {{{
set backup
set history=1024
set undofile

"------ directories {{{
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
"------ }}}
"---- }}}

"---- mappings {{{
" faster command mode
nmap ; :

" up/down keys to be based on display lines, not physical lines
map j gj
map k gk

" faster exit insert
inoremap jk <Esc>

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

"------ leaders {{{
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
map <silent><leader>\ :%s/\s\+$//<CR>:let @/=''<CR>

" toggle highlight search
nmap <silent><leader>/ :set hlsearch! hlsearch?<CR>

" toggle diff mode for current buffer
noremap <silent><leader>dt :call DiffToggle()<CR>
"------ }}}
"---- }}}

"---- plugins {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

"------ tools {{{
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'kana/vim-textobj-user'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-unimpaired'
Bundle 'benmills/vimux'
Bundle 'Valloric/YouCompleteMe'
"------ }}}

"------ css {{{
Bundle 'hail2u/vim-css3-syntax'
"------ }}}

"------ html {{{
Bundle 'othree/html5.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'othree/xml.vim'
"------ }}}

"------ javascript {{{
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'teramako/jscomplete-vim'
"------ }}}

"------ ruby {{{
Bundle 'tpope/vim-endwise'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-ruby/vim-ruby'
"------ }}}

"------ rails {{{
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
"------ }}}

"------ colors {{{
Bundle 'w0ng/vim-hybrid'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'jnurmine/Zenburn'
"------ }}}

filetype plugin indent on
syntax on
"---- }}}

"---- plugin settings {{{
"------ CtrlP {{{
let g:ctrlp_user_command = "find %s -type f | egrep -v '/\.(git|hg|svn|DS_Store|bundle)|log|tmp/'"
let g:ctrlp_use_caching = 1
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ {{{
let g:easytags_updatetime_autodisable = 1
"------ }}}

"------ indent guides {{{
let g:indent_guides_start_level = 2
"------ }}}

"------ jscomplete {{{
let g:jscomplete_use = ['dom']
"------ }}}

"------ NERDTree {{{
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.DS_Store$','\.bundle$','\.git$']
let NERDTreeHijackNetrw = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 30
"------ }}}

"------ Powerline {{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"------ }}}

"------ vimux {{{
let g:VimuxUseNearestPane = 1
"------ }}}
"---- }}}

"---- plugin mappings {{{
"------ Ack {{{
nmap <leader>a :Ack! 
"------ }}}

"------ Gundo {{{
map <leader>u :GundoToggle<CR>
"------ }}}

"------ NERDTree {{{
map <leader>n :NERDTreeToggle<CR>
"------ }}}

"------ TagBar {{{
map <leader>t :TagbarToggle<CR>
"------ }}}

"------ vimux {{{
" Prompt for a command to run
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vx :VimuxClosePanes<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vc :VimuxInterruptRunner<CR>
nmap <Leader>vp :VimuxPromptCommand<CR>
vmap <Leader>vp "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
"------ }}}
"----}}}

"---- autocmds {{{
if has("autocmd")
	augroup vim
		" autosource vimrc on write
		au BufWritePost .vimrc source $MYVIMRC

		" open NERDTree automatically if no files are specified
		au VimEnter * if !argc() | NERDTree | endif
	augroup END

	augroup filetypes
		" fix html indenting
		au FileType html setlocal indentkeys-=*<Return>

		" set xml formatting command to xmllint
		au FileType xml setlocal equalprg="XMLLINT_INDENT=	 xmllint --format --recover - 2>/dev/null"

		" add html as mobile erb subtype
		au BufNewFile,BufRead *.mobile.erb let b:eruby_subtype = 'html'
	augroup END

	augroup editing
		" exit paste mode when leaving insert mode
		au InsertLeave * set nopaste

		" only show linenumbers on current buffer
		au BufEnter * if !exists("b:NERDTreeType") | set number | endif
		au BufLeave * if !exists("b:NERDTreeType") | set nonumber | endif

		" show extra whitespace as red
		au BufWinEnter * match ExtraWhitespace /\s\+$/
		au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
		au InsertLeave * match ExtraWhitespace /\s\+$/
		au BufWinLeave * call clearmatches()
	augroup END
endif
"---- }}}

"---- functions {{{
function! DiffToggle()
	if &l:diff == 0
		diffthis
	else
		diffoff
	endif
endfunction
"---- }}}

"---- gui {{{
let g:hybrid_use_Xresources = 1
colorscheme hybrid

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"---- }}}

" vim: foldmethod=marker foldlevel=0
