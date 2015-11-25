" Andrew Krawchyk
" Options are organized similarly to the :options command
"
"--- important {{{
set nocompatible
"--- }}}


"---- plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

runtime macros/matchit.vim

call plug#begin()

"------ colors {{{
Plug 'chriskempson/base16-vim'
"------ }}}

"------ tools {{{
Plug 'tpope/vim-abolish'
Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'coderifous/textobj-word-column.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': 'chmod +x ./install.py; python ./install.py' }
"------ }}}

"------ html {{{
Plug 'Valloric/MatchTagAlways'
Plug 'sukima/xmledit'
"------ }}}

"------ javascript {{{
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
"------ }}}

"------ php {{{
Plug 'evidens/vim-twig'
"------ }}}

"------ python {{{
Plug 'jmcantrell/vim-virtualenv'
"------ }}}

"------ sass {{{
Plug 'cakebaker/scss-syntax.vim'
"------}}

"------ django {{{
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mjbrownie/django-template-textobjects'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'
Plug 'jmcomets/vim-pony'
"------ }}}

call plug#end()
"---- }}}


"--- moving around, searching and patterns {{{
set incsearch
set ignorecase
set smartcase
"--- }}}

"--- tags {{{
set tags=tags;
"--- }}}

"--- displaying text {{{
set nowrap
set scrolloff=3
set sidescrolloff=3
set lazyredraw
set list
set listchars=tab:˒\ ,trail:·,extends:…,precedes:…,nbsp:+
set number
set numberwidth=1
set display+=lastline
"--- }}}

"--- syntax, highlighting and spelling {{{
set background=dark
set nocursorline
"--- }}}

"--- multiple windows {{{
set laststatus=2
set equalalways
set eadirection=both
set hidden
set splitbelow
set splitright
"--- }}}

"--- multiple tab pages {{{
set tabpagemax=50
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
set ruler
set showcmd
set shortmess=aoOstTI
set visualbell
"--- }}}

"--- selecting text {{{
set clipboard=unnamed
"--- }}}

"--- editing text {{{
set backspace=indent,eol,start
set complete-=i
set completeopt=menu,menuone
set showmatch
set nrformats-=octal
"--- }}}

"--- tabs and indenting {{{
set tabstop=8
set shiftwidth=8
set smarttab
set softtabstop=0
set shiftround
set noexpandtab
set autoindent
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
set backupdir=~/.vim/backup
set autowrite
set autoread
set fileformats+=mac
"--- }}}

"--- the swap file {{{
set directory=~/.vim/tmp
"--- }}}

"--- command line editing {{{
set history=2048
set wildmode=longest:full,list:full
set wildignorecase
set wildignore+=*.DS_Store,~*
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildignore+=*.exe,*.dll,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*
set wildignore+=*/.sass-cache/*,*/bower_components/*,*/node_modules/*,*/__pycache__/*,
set wildmenu
set undofile
set undodir=~/.vim/tmp/undo
"--- }}}

"--- executing external commands {{{
"--- }}}

"--- running make and jumping to errors {{{
"--- }}}

"--- language specific {{{
"--- }}}

"--- multi-byte characters {{{
set encoding=utf-8
set termencoding=utf-8
"--- }}}

"--- various {{{
set gdefault
set sessionoptions-=options
if !empty(&viminfo)
	set viminfo^=!
endif
"--- }}}


"---- functions {{{
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction
"---- }}}


"---- plugin settings {{{

"------ ack {{{
if executable('ag')
	  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_autofold_results = 1
let g:ack_use_dispatch = 1
"------ }}}

"------ ctrlp.vim {{{
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](dist|src\/bower_components)$',
"   \ }
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ htmldjango_omnicomplete {{{
let g:htmldjangocomplete_html_flavour = 'html5'
"------ }}}

"------ indent guides {{{
let g:indent_guides_start_level = 2
"------ }}}

"------ javascript {{{
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
"------ }}}

"------ javascript-libraries-syntax {{{
let g:used_javascript_libs = 'angularjs,jasmine,jquery'
"------ }}}

"------ MatchTagAlways {{{
let g:mta_filetypes = {
			\ 'html'            : 1,
			\ 'xhtml'           : 1,
			\ 'xml'             : 1,
			\ 'handlebars.html' : 1,
			\ 'htmldjango'      : 1
			\}
"------ }}}

"------ netrw {{{
" let g:netrw_liststyle = 3
"------ }}}

"------ surround {{{
let g:surround_indent = 1
"------ }}}

"------ Syntastic {{{
let g:syntastic_auto_jump      = 0
let g:syntastic_auto_loc_list  = 0
let g:syntastic_check_on_open  = 1
let g:syntastic_enable_signs   = 1
let g:syntastic_error_symbol   = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '»'
let g:syntastic_style_warning_symbol = '»'
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylama']
let g:syntastic_html_tidy_ignore_errors = [
			\ 'trimming empty <i>',
			\ 'trimming empty <span>',
			\ '<input> proprietary attribute \"autocomplete\"',
			\ 'proprietary attribute \"role\"',
			\ 'proprietary attribute \"hidden\"',
			\ 'proprietary attribute \"ng-',
			\ '<svg> is not recognized!',
			\ 'discarding unexpected <svg>',
			\ 'discarding unexpected </svg>',
			\ '<rect> is not recognized!',
			\ 'discarding unexpected <rect>'
			\ ]
"------- }}}

"------ Tagbar {{{
let g:tagbar_autoclose       = 1
let g:tagbar_autofocus       = 1
let g:tagbar_autoshowtag     = 1
let g:tagbar_show_visibility = 1
"------ }}}

"------ UltiSnips {{{
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets        = "<c-e>"
let g:UltiSnipsSnippetDirectories  = ["snips"]
"------ }}}

"------ YouCompleteMe {{{
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax        = 1
let g:ycm_complete_in_comments                = 1
let g:ycm_complete_in_strings                 = 1
let g:ycm_path_to_python_interpreter          = '/usr/local/bin/python'
"------ }}}

"------ xmledit {{{
let g:xmledit_enable_html = 1
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
inoremap <C-U> <C-G>u<C-U>

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

" write file without correct permissions when opened
cmap w!! %!sudo tee > /dev/null %

" insert the current directory into a command-line path
cmap <C-p> <C-R>=expand("%:p:h") . "/"<CR>

" faster scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" use sane regex
nnoremap / /\v
nnoremap s/ s/\v
nnoremap %s/ %s/\v
vnoremap / /\v
vnoremap %s/ %s/\v

" keep search in center of window
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" change tabs with shift
noremap <S-l> gt
noremap <S-h> gT


"------ leaders {{{
let mapleader=','
let maplocalleader='\'

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Auto-indent whole file
nmap <leader>= gg=G``
map <silent><leader>=f gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" autoindent pasted blocks
nnoremap <leader>[p p`[v`]=
nnoremap <leader>]p P`]v`[=

" clean trailing whitespace
map <silent><leader>\ :%s/\s\+$//<CR>:let @/=''<CR>

" toggle highlight search
nmap <silent><leader>/ :set hlsearch! hlsearch?<CR>

" reselect pasted text
nnoremap <leader>v V`]

" fast edit vimrc
nnoremap <leader>evm <C-w><C-v><C-l>:e $MYVIMRC<CR>

" close quick/location fix/list
nnoremap <leader>q :ccl<CR>
nnoremap <leader>l :lcl<CR>
"------ }}}
"---- }}}


"---- plugin mappings {{{
"------ Ack {{{
nmap <leader>a :Ack!<space>
"------ }}}

"------ Dispatch {{{
nmap <leader>d :Dispatch<CR>
"------ }}}

"------ Gundo {{{
map <leader>u :GundoToggle<CR>
"------ }}}

"------ TagBar {{{
map <leader>t :TagbarToggle<CR>
"------ }}}
"---- }}}


"---- autocmds {{{
if has("autocmd")
	augroup vim
		au!

		" autosource vimrc on write
		au BufWritePost .vimrc source $MYVIMRC
	augroup END

	augroup filetypes
		au!

		" fix html indenting
		au FileType html setlocal indentkeys-=*<Return>

		" set xml formatting command to xmllint
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

		" set custom indentation
		au FileType html,handlebars.html,htmldjango,css,scss,php,twig setlocal sts=4 sw=4 et
		au FileType javascript,yaml setlocal sts=2 sw=2 et

		" set custom filetypes for syntax and snippets
		au BufRead,BufNewFile *.scss set filetype=scss.css
		au FileType jinja set filetype=jinja.htmldjango
		au BufRead,BufNewFile *.jsm set filetype=javascript

		" set tab completion on css-classes
		au FileType scss,css,haml,html setlocal iskeyword+=-

		" surround custom replacements
		au FileType html,htmldjango let b:surround_{char2nr("d")} = "<div\1class: \r..*\r class=\"&\"\1>\r</div>"
		au FileType html,htmldjango let b:surround_{char2nr("p")} = "<p\1class: \r..*\r class=\"&\"\1>\r</p>"
		au FileType html,htmldjango let b:surround_{char2nr("s")} = "<span\1class: \r..*\r class=\"&\"\1>\r</span>"
		au FileType htmldjango let b:surround_{char2nr("v")} = "{{ \r }}"
		au FileType htmldjango let b:surround_{char2nr("{")} = "{{ \r }}"
		au FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
		au FileType htmldjango let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
		au FileType htmldjango let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
		au FileType htmldjango let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
		au FileType htmldjango let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
		au FileType htmldjango let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

		" delimitmate custom matches
		au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

		" django custom omnicomplete
		au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
		au FileType htmldjango inoremap {% {% %}<left><left><left>
		au FileType htmldjango inoremap {{ {{ }}<left><left><left>
	augroup END

	augroup editing
		au!

		" tabs to complete snippets
		au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

		" exit paste mode when leaving insert mode
		au InsertLeave * set nopaste

		" only show linenumbers on current buffer
		au BufEnter * set number
		au BufLeave * set nonumber

		" show extra whitespace as red
		au BufWinEnter * match ExtraWhitespace /\s\+$/
		au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
		au InsertLeave * match ExtraWhitespace /\s\+$/
		au BufWinLeave * call clearmatches()
	augroup END
endif
"---- }}}

"---- gui {{{
let base16colorspace=256
colorscheme base16-eighties
let &colorcolumn=80
highlight ColorColumn ctermbg=18 guibg=gray

highlight ExtraWhitespace ctermbg=196 guibg=red

highlight SyntasticErrorSign ctermbg=09 ctermfg=196
highlight SyntasticWarningSign ctermbg=03 ctermfg=202
highlight SyntasticStyleErrorSign ctermbg=19 ctermfg=246
highlight SyntasticStyleWarningSign ctermbg=19 ctermfg=240
"---- }}}
