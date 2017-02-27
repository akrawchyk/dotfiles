" Andrew Krawchyk
" Options are organized similarly to the :options command
"

if filewritable('.') && !filewritable('~/.vim/tmp')
	silent execute '!mkdir -p $HOME/.vim/tmp'
endif


"--- important {{{
set nocompatible
"--- }}}

"---- plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	au VimEnter * PlugInstall
endif

if !exists('g:loaded_matchit')
	runtime macros/matchit.vim
endif

call plug#begin()

"------ colors {{{
Plug 'chriskempson/base16-vim'
"------ }}}

"------ tools {{{
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-emoji'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-lion'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': 'chmod +x ./install.py; python ./install.py --tern-completer' }
"------ }}}

"------ html {{{
Plug 'Valloric/MatchTagAlways'
Plug 'sukima/xmledit'
"------ }}}

"------ javascript {{{
Plug 'othree/javascript-libraries-syntax.vim'
"------ }}}

"------ css {{{
Plug 'cakebaker/scss-syntax.vim'
Plug 'kewah/vim-stylefmt'
"------ }}}

call plug#end()
"---- }}}

"--- moving around, searching and patterns {{{
set incsearch " show match for partly typed search command
set ignorecase " ignore case in search patterns
set smartcase " override the 'ignorecase' option if the search pattern contains uppercase characters
set wrapscan " search commands wrap around the end of the buffer
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
"--- }}}

"--- tags {{{
"--- }}}

"--- displaying text {{{
set display=lastline " include lastline to show the last line even if it doesn't fit
set lazyredraw " don't redraw while executing macros
set list " show <Tab> as ^I and end-of-line as $
if has('multi_byte') && &encoding ==# 'utf-8'
	" list of strings used for list mode
	let &listchars = 'tab:˒ ,trail:·,extends:…,precedes:…,nbsp:+'
else
	let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif
set nowrap " long lines wrap
"--- }}}

"--- syntax, highlighting and spelling {{{
set background=dark
set cursorline " highlight the screen line of the cursor
set synmaxcol=200 " maximum column to look for syntax items
if has('termguicolors')
	set termguicolors
endif
"--- }}}

"--- multiple windows {{{
set hidden " don't unload a buffer when no longer shown in a window
set laststatus=2 " 0, 1 or 2; when to use a status line for the last window
set splitbelow " a new window is put below the current one
set splitright " a new window is put right of the current one
"--- }}}

"--- multiple tab pages {{{
"--- }}}

"--- terminal {{{
set ttyfast " terminal connection is fast
"--- }}}

"--- using the mouse {{{
"--- }}}

"--- printing {{{
"--- }}}

"--- messages and info {{{
set ruler " show cursor position below each window
set report=0 " threshold for reporting number of changed lines
set showcmd " show (partial) command keys in the status line
set shortmess=aoOtI " list of flags to make messages shorter"
set showmode " display the current mode in the status line
"--- }}}

"--- selecting text {{{
set clipboard=unnamed
"--- }}}

"--- editing text {{{
set backspace=indent,eol,start " specifies what <BS>, CTRL-W, etc. can do in Insert mode
set complete-=i " specifies how Insert mode completion works for CTRL-N and CTRL-P
set completeopt=menu,menuone " whether to use a popup menu for Insert mode completion
set undofile " automatically save and restore undo history
set undodir^=$HOME/.vim/tmp// " list of directories for undo files
"--- }}}

"--- tabs and indenting {{{
set autoindent " automatically set the indent of a new line
set shiftround " round to 'shiftwidth' for '<<' and '>>'
"--- }}}

"--- folding {{{
set foldmethod=marker " folding type: 'manual', 'indent', 'expr', 'marker' or 'syntax'
set foldopen+=jump " specifies for which commands a fold will be opened
"--- }}}

"--- diff mode {{{
"--- }}}

"--- mapping {{{
"--- }}}

"--- reading and writing files {{{
set backup " keep a backup after overwriting a file
set backupdir^=$HOME/.vim/tmp// " list of directories to put backup files in
set backupext=.bak " file name extension for the backup file
set autoread " automatically read a file when it was modified outside of Vim
"--- }}}

"--- the swap file {{{
set directory^=$HOME/.vim/tmp// " list of directories for the swap file
set updatecount=100 " number of characters typed to cause a swap file update
"--- }}}

"--- command line editing {{{
set wildmode=longest:full,full
set wildignore+=tags,*.pyc
set wildmenu " command-line completion shows a list of matches
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
set gdefault " use the 'g' flag for :substitute
set viminfo='100,n$HOME/.vim/tmp/viminfo " list that specifies what to write in the viminfo file
"--- }}}

"--- term {{{
set t_Co=256 " number of colors
"--- }}}


"---- plugin settings {{{

"------ airline {{{
let g:airline_theme     = 'base16color'

" see https://github.com/vim-airline/vim-airline/blob/a2431f2adb23a003abdfe5294861bbd69de52e52/doc/airline.txt#L176
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" see https://github.com/vim-airline/vim-airline/blob/a2431f2adb23a003abdfe5294861bbd69de52e52/doc/airline.txt#L252
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
"------ }}}

"------ ale {{{
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_standard_use_global = 1
" let g:ale_linters = {
" 			\ 'javascript': ['eslint']
" 			\}
if emoji#available()
	let g:ale_sign_error   = emoji#for('boom')
	let g:ale_sign_warning = emoji#for('bomb')
elseif has('multi_byte') && &encoding ==# 'utf-8'
	let g:ale_sign_error   = '✗'
	let g:ale_sign_warning = '⚠'
else
	let g:ale_sign_error   = 'E'
	let g:ale_sign_warning = 'W'
endif
"------ }}}

"------ autoformat {{{
let g:autoformat_verbosemode = 1
"------ }}}

"------ ctrlp.vim {{{
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden = 1
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ javascript-libraries-syntax {{{
let g:used_javascript_libs = 'jquery,underscore,backbone'
"------ }}}

"------ MatchTagAlways {{{
let g:mta_filetypes = {
			\ 'html'            : 1,
			\ 'xhtml'           : 1,
			\ 'xml'             : 1,
			\ 'jinja'           : 1
			\}
"------ }}}

"------ surround {{{
let g:surround_indent = 1
"------ }}}

"------ Syntastic {{{
" let g:syntastic_auto_jump      = 0
" let g:syntastic_auto_loc_list  = 0
" let g:syntastic_check_on_open  = 1
" let g:syntastic_enable_signs   = 1
" if emoji#available()
" 	let g:syntastic_error_symbol         = emoji#for('boom')
" 	let g:syntastic_warning_symbol       = emoji#for('bomb')
" 	let g:syntastic_style_error_symbol   = emoji#for('poop') + emoji#for('poop')
" 	let g:syntastic_style_warning_symbol = emoji#for('poop')
" elseif has('multi_byte') && &encoding ==# 'utf-8'
" 	let g:syntastic_error_symbol         = '✗'
" 	let g:syntastic_warning_symbol       = '⚠'
" 	let g:syntastic_style_error_symbol   = '»»'
" 	let g:syntastic_style_warning_symbol = '»'
" else
" 	let g:syntastic_error_symbol         = 'E'
" 	let g:syntastic_warning_symbol       = 'W'
" 	let g:syntastic_style_error_symbol   = 'S'
" 	let g:syntastic_style_warning_symbol = 's'
" endif
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_javascript_checkers    = ['eslint']
" let g:syntastic_python_checkers        = ['flake8']
"------- }}}

"------ UltiSnips {{{
let g:UltiSnipsExpandTrigger       = '<Tab>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
"------ }}}

"------ YouCompleteMe {{{
let g:ycm_key_list_select_completion          = ['<C-n>']
let g:ycm_key_list_previous_completion        = ['<C-p>']
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
noremap Y y$
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
xnoremap < <gv

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
xnoremap / /\v
xnoremap %s/ %s/\v

" keep search in center of window
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" apply macros with Q
nnoremap Q @q
xnoremap Q :norm @q<cr>

" change tabs with shift
noremap <S-l> gt
noremap <S-h> gT

" jump to last edited file with BS
nnoremap <BS> <C-^>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" move forward and backward (fixme) in the quickfix list
nnoremap <silent> <C-N> :cn<CR>zv
" nmap <silent> <C-P> :cp<CR>zv

" autoformat file
noremap <F3> :Autoformat<CR>


"------ leaders {{{
let mapleader=','
let maplocalleader='\'

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<CR>
noremap <leader>ew :e %%
noremap <leader>es :sp %%
noremap <leader>ev :vsp %%
noremap <leader>et :tabe %%

" Auto-indent whole file
nnoremap <leader>= gg=G``
noremap <silent><leader>=f gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" autoindent pasted blocks
nnoremap <leader>[p p`[v`]=
nnoremap <leader>]p P`]v`[=

" clean trailing whitespace
noremap <silent><leader>\ :%s/\s\+$//<CR>:let @/=''<CR>

" toggle highlight search
nnoremap <silent><leader>/ :set hlsearch! hlsearch?<CR>

" reselect pasted text
nnoremap <leader>v V`]

" fast edit vimrc
nnoremap <leader>evm <C-w><C-v><C-l>:e $MYVIMRC<CR>

" close quick/location fix/list
nnoremap <leader>q :ccl<CR>
nnoremap <leader>l :lcl<CR>

" easy paste mode
nnoremap <silent><leader>p :set paste<CR>

" YouCompleteMe Tern commands
noremap <leader>tD :YcmCompleter GetDoc<CR>
noremap <leader>tt :YcmCompleter GetType<CR>
noremap <leader>td :YcmCompleter GoToDefinition<CR>
noremap <leader>tr :YcmCompleter GoToReferences<CR>
noremap <leader>tR :YcmCompleter RefactorRename<SPACE>

" search for arbitrary input
nnoremap \ :Ag<SPACE>
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

		" set xml formatting command to xmllint
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

		" set custom indentation
		au FileType html,htmldjango,jinja,css,scss setlocal sts=4 sw=4 et
		au FileType javascript,json,yaml setlocal sts=2 sw=2 et
		au FileType htmldjango set filetype=htmldjango.html

		" set custom filetypes for syntax and snippets
		au BufRead,BufNewFile *.scss set filetype=scss.css
		au BufRead,BufNewFile *.jsm set filetype=javascript

		" set tab completion on css-classes
		au FileType scss,css,html setlocal iskeyword+=-

		" delimitmate custom matches
		au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

		" custom matchit pairs b:match_words
		au FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'

		" quickfix full width bottom
		au FileType qf wincmd J
	augroup END

	augroup editing
		au!

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

		" smart show cursorline
		au WinEnter    * set cursorline
		au WinLeave    * set nocursorline
		au InsertEnter * set nocursorline
		au InsertLeave * set cursorline

		" open quickfix after grep
		au QuickFixCmdPost *grep* cwindow
	augroup END
endif
"---- }}}

"---- gui {{{
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" same thing, but with escape sequences instead of literals
" set t_8f=[38;2;%lu;%lu;%lum
" set t_8b=[48;2;%lu;%lu;%lum

if !exists('g:colors_name') || g:colors_name != 'base16-eighties'
	" let base16colorspace=256
	colorscheme base16-eighties
endif

let &colorcolumn=80

highlight ColorColumn ctermbg=236 guibg=gray18
highlight ExtraWhitespace ctermbg=196 guibg=red
highlight SyntasticErrorSign ctermbg=09 ctermfg=196
highlight SyntasticWarningSign ctermbg=03 ctermfg=202
highlight SyntasticStyleErrorSign ctermbg=19 ctermfg=246
highlight SyntasticStyleWarningSign ctermbg=19 ctermfg=240
"---- }}}
