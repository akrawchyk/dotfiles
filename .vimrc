"--- important {{{
set nocompatible
"--- }}}

"--- moving around, searching and patterns {{{
set incsearch
set ignorecase
set smartcase
"--- }}}

"--- tags {{{
"--- }}}

"--- displaying text {{{
set nowrap
set scrolloff=3
set sidescrolloff=3
set lazyredraw
set list
set listchars=tab:˒\ ,trail:·,extends:…,precedes:…
set number
set numberwidth=1
"--- }}}

"--- syntax, highlighting and spelling {{{
set background=dark
set nocursorline
"--- }}}

"--- multiple windows {{{
set laststatus=2
set equalalways
set eadirection=both
set winheight=5
set winminheight=2
set winwidth=5
set winminwidth=5
set hidden
set splitbelow
set splitright
"--- }}}

"--- multiple tab pages {{{
"--- }}}

"--- terminal {{{
set ttyfast
set scrolljump=3
set t_Co=256
"--- }}}

"--- using the mouse {{{
set ttymouse=xterm2
"--- }}}

"--- printing {{{
"--- }}}

"--- messages and info {{{
set shortmess=aoOstTI
set visualbell
"--- }}}

"--- selecting text {{{
set clipboard=unnamed
"--- }}}

"--- editing text {{{
set backspace=indent,eol,start
set completeopt=menuone
set showmatch
"--- }}}

"--- tabs and indenting {{{
set tabstop=8
set shiftwidth=8
set smarttab
set softtabstop=0
set shiftround
set noexpandtab
set smartindent
set copyindent
"--- }}}

"--- folding {{{
set nofoldenable
set foldlevelstart=2
set foldmethod=syntax
"--- }}}

"--- diff mode {{{
"--- }}}

"--- mapping {{{
set ttimeout
set ttimeoutlen=50
"--- }}}

"--- reading and writing files {{{
set modelines=0
set backup
set backupdir=~/.vim/tmp/backup
set autowrite
set autoread
"--- }}}

"--- the swap file {{{
set directory=~/.vim/tmp
"--- }}}

"--- command line editing {{{
set history=1024
set wildmode=longest:full,list:full
set wildignorecase
set wildignore+=*.DS_Store
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildmenu
set undofile
set undodir=~/.vim/tmp/undo
"--- }}}

"--- executing external commands {{{
"--- }}}

"--- running make and jumping to errors {{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
"--- }}}

"--- language specific {{{
"--- }}}

"--- multi-byte characters {{{
set encoding=utf-8
set termencoding=utf-8
"--- }}}

"--- various {{{
set sessionoptions=blank,curdir,folds,help,tabpages,winpos
"--- }}}

"---- functions {{{
function! DiffToggle()
	if &l:diff == 0
		diffthis
	else
		diffoff
	endif
endfunction
"---- }}}

"---- plugins {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

"------ tools {{{
Bundle 'tpope/vim-abolish'
Bundle 'mileszs/ack.vim'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-dispatch'
Bundle 'terryma/vim-expand-region'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
" Bundle 'itchyny/lightline.vim'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'justinmk/vim-sneak'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-user'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'Valloric/YouCompleteMe'
"------ }}}

"------ css {{{
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
"------ }}}

"------ html {{{
Bundle 'othree/html5.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'othree/xml.vim'
"------ }}}

"------ git {{{
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'
""------- }}}

"------ javascript {{{
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'marijnh/tern_for_vim'
"------ }}}

"------ php {{{
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
"------ }}}

"------ python {{{
Bundle 'Glench/Vim-Jinja2-Syntax'
"------ }}}

"------ ruby {{{
Bundle 'tpope/vim-endwise'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'vim-ruby/vim-ruby'
"------ }}}

"------ rails {{{
" Bundle 'tpope/vim-bundler'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-rake'
" Bundle 'tpope/vim-rails'
"------ }}}

"------ colors {{{
Bundle 'chriskempson/base16-vim'
"------ }}}

filetype plugin indent on
syntax enable
"---- }}}

"---- plugin settings {{{
"------ ack {{{
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'
endif
"------ }}}

"------ airline {{{
let g:airline_theme="tomorrow"
"------ }}}

"------ CtrlP {{{
let g:ctrlp_persistent_input = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ indent guides {{{
let g:indent_guides_start_level = 2
"------ }}}

"------ javascript {{{
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
let g:used_javascript_libs = 'angularjs'
"------ }}}

"------ NERDTree {{{
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCasadeOpenSingleChildDir = 1
let NERDTreeChDirMode = 2
let NERDTreeHijackNetrw = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\.DS_Store$','\.bundle$','\.git$']
" let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 30
"------ }}}

"------ rails.vim {{{
" let g:rails_projections = {
" 			\ 'app/uploaders/*_uploader.rb': {
" 			\	'command': 'uploader',
" 			\	'template': 'class %SUploader < CarrierWave::Uploader::Base\nend',
" 			\	'keywords': 'process version'
" 			\ }
" 		\ }
"------ }}}

"------ surround {{{
let g:surround_indent = 1
"------ }}}

"------ Syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_html_tidy_ignore_errors = [
	\ "trimming empty <i>",
	\ "trimming empty <span>",
	\ "<input> proprietary attribute \"autocomplete\"",
	\ "proprietary attribute \"role\"",
	\ "proprietary attribute \"hidden\"",
	\ "proprietary attribute \"ng-"
\ ]
"------- }}}

"------ Tagbar {{{
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_show_visibility = 1
let g:tagbar_status_func = 'TagbarStatusFunc'
"------ }}}

"------ UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger = "<TAB>"
let g:UltiSnipsJumpBackwardTrigger = "<S-TAB>"
"------ }}}

"------ yankstack {{{
let g:yankstack_map_keys = 0
" https://github.com/maxbrunsfeld/vim-yankstack#compatibility
call yankstack#setup()
"------ }}}

"------ YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_seed_identifiers_with_syntax = 1
"------ }}}
"---- }}}

"---- mappings {{{
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
xnoremap > >gv
vnoremap < <gv

" use sane regexes
nnoremap / /\v
xnoremap / /\v

" write file without correct permissions when opened
cmap w!! %!sudo tee > /dev/null %

" insert the current directory into a command-line path
cmap <C-p> <C-R>=expand("%:p:h") . "/"<CR>

" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"------ leaders {{{
let mapleader=','
let localmapleader='\'

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent><leader>=f gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" autoindent pasted blocks
nnoremap <leader>[p p`[v`]=
nnoremap <leader>]p P`]v`[=

" clean trailing whitespace
map <silent><leader>\ :%s/\s\+$//<CR>:let @/=''<CR>

" toggle highlight search
nmap <silent><leader>/ :set hlsearch! hlsearch?<CR>

" toggle diff mode for current buffer
noremap <silent><leader>dt :call DiffToggle()<CR>
"------ }}}
"---- }}}

"---- plugin mappings {{{
"------ Ack {{{
nmap <leader>a :Ack!<space>
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

"------ yankstack {{{
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
"------ }}}
"---- }}}

"---- autocmds {{{
if has("autocmd")
	augroup vim
		au!

		" autosource vimrc on write
		au BufWritePost .vimrc source $MYVIMRC

		" open NERDTree automatically if no files are specified
		au VimEnter * if !argc() | NERDTree | endif
	augroup END

	augroup filetypes
		au!

		" fix html indenting
		au FileType html setlocal indentkeys-=*<Return>

		" set xml formatting command to xmllint
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

		" add html as mobile erb subtype
		au BufNewFile,BufRead *.mobile.erb let b:eruby_subtype = 'html'

		" set custom indentation
		au FileType scss,css,eruby,haml setlocal sts=2 sw=2

		" set tab completion on css-classes
		au FileType scss,css,eruby,haml setlocal iskeyword+=-

		" surround custom replacements
		au FileType eruby let b:surround_45 = "<% \r %>"
		au FileType eruby let b:surround_61 = "<%= \r %>"
		au FileType eruby let b:surround_92 = "<%# \r %>"
		au FileType html,eruby let b:surround_100 = "<div>\r</div>"
		au FileType html,eruby let b:surround_112 = "<p>\r</p>"
		au FileType html,eruby let b:surround_115 = "<span>\r</span>"
	augroup END

	augroup editing
		au!

		" exit paste mode when leaving insert mode
		au InsertLeave * set nopaste

		" only show linenumbers on current buffer
		" au BufEnter * if !exists("b:NERDTreeType") | set number | endif
		" au BufLeave * if !exists("b:NERDTreeType") | set nonumber | endif

		" show extra whitespace as red
		au BufWinEnter * match ExtraWhitespace /\s\+$/
		au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
		au InsertLeave * match ExtraWhitespace /\s\+$/
		au BufWinLeave * call clearmatches()
	augroup END
endif
"---- }}}

"---- gui {{{
" let base16colorspace=256
colorscheme base16-tomorrow

let &colorcolumn=81
highlight ColorColumn ctermbg=10 guibg=#2c2d27

highlight ExtraWhitespace ctermbg=196 guibg=red

" highlight SyntasticErrorLine ctermbg=210 ctermfg=160
highlight SyntasticErrorSign ctermbg=210 ctermfg=160
" highlight SyntasticWarningLine ctermbg=227 ctermfg=166
highlight SyntasticWarningSign ctermbg=227 ctermfg=166
"---- }}}
