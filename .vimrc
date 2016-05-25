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

if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif

call plug#begin()

"------ colors {{{
Plug 'chriskempson/base16-vim'
"------ }}}

"------ tools {{{
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-grepper'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
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

"------ sass {{{
Plug 'cakebaker/scss-syntax.vim'
"------}}

call plug#end()
"---- }}}


"--- moving around, searching and patterns {{{
set incsearch " show match for partly typed search command
set ignorecase " ignore case in search patterns
set smartcase " override the 'ignorecase' option if the search pattern contains uppercase characters
set wrapscan " search commands wrap around the end of the buffer
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
set t_Co=256
"--- }}}

"--- using the mouse {{{
"--- }}}

"--- printing {{{
"--- }}}

"--- messages and info {{{
set report=0 " threshold for reporting number of changed lines
set showcmd " show (partial) command keys in the status line
set shortmess=aoOstTI " list of flags to make messages shorter"
set showmode " display the current mode in the status line
"--- }}}

"--- selecting text {{{
set clipboard=unnamed
"--- }}}

"--- editing text {{{
set backspace=indent,eol,start " specifies what <BS>, CTRL-W, etc. can do in Insert mode
set complete-=i " specifies how Insert mode completion works for CTRL-N and CTRL-P
set completeopt=menu,menuone " whether to use a popup menu for Insert mode completion
"--- }}}

"--- tabs and indenting {{{
set autoindent " automatically set the indent of a new line
set noexpandtab " expand <Tab> to spaces in Insert mode
"--- }}}

"--- folding {{{
"--- }}}

"--- diff mode {{{
"--- }}}

"--- mapping {{{
"--- }}}

"--- reading and writing files {{{
set backup " keep a backup after overwriting a file
set backupdir=$HOME/.vim/tmp/backup/ " list of directories to put backup files in
set backupext=.bak " file name extension for the backup file
"--- }}}

"--- the swap file {{{
set directory=$HOME/.vim/tmp/swap/ " list of directories for the swap file
set updatecount=100 " number of characters typed to cause a swap file update
"--- }}}

"--- command line editing {{{
set undofile " automatically save and restore undo history
set undodir=$HOME/.vim/tmp/undo/ " list of directories for undo files
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
set gd " use the 'g' flag for :substitute
set viminfo='100,n$HOME/.vim/tmp/viminfo " list that specifies what to write in the viminfo file
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

"------ airline {{{
let g:airline_theme='base16color'
"------ }}}

"------ ctrlp.vim {{{
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_show_hidden = 1
" https://github.com/ctrlpvim/ctrlp.vim/wiki/ctrlp-configration
let g:ctrlp_user_command = {
			\ 'types': {
			\ 1: ['.git', 'cd %s && git ls-files -c -o --exclude-standard'],
			\ 2: ['.hg', 'hg --cwd %s locate -I .'],
			\ },
			\ 'fallback': 'ag %s -i --nocolor --nogroup --hidden
			\ --ignore out
			\ --ignore .git
			\ --ignore .svn
			\ --ignore .hg
			\ --ignore .DS_Store
			\ --ignore node_modules
			\ --ignore "**/*.pyc"
			\ -g ""'
			\ }
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ javascript-libraries-syntax {{{
let g:used_javascript_libs = 'jasmine,jquery'
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
let g:syntastic_auto_jump      = 0
let g:syntastic_auto_loc_list  = 0
let g:syntastic_check_on_open  = 1
let g:syntastic_enable_signs   = 1
if has('multi_byte') && &encoding ==# 'utf-8'
	let g:syntastic_error_symbol   = '💥'
	let g:syntastic_warning_symbol = '💣'
	let g:syntastic_style_error_symbol = '💩💩'
	let g:syntastic_style_warning_symbol = '💩'
else
	let g:syntastic_error_symbol   = 'E'
	let g:syntastic_warning_symbol = 'W'
	let g:syntastic_style_error_symbol = 'S'
	let g:syntastic_style_warning_symbol = 's'
endif
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylama']
" let g:syntastic_python_pylama_exec = '/home/andrew/.local/bin/pylama'
"------- }}}

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

"---- commands {{{
command! -nargs=* -complete=file GG Grepper -tool git -query <args>
command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --vimgrep <args>
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

" easy paste mode
nnoremap <silent><leader>p :set paste<CR>

" grepper on motions or visual selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
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
		au FileType html,jinja,css,scss setlocal sts=4 sw=4 et
		au FileType javascript,yaml setlocal sts=2 sw=2 et

		" set custom filetypes for syntax and snippets
		au BufRead,BufNewFile *.scss set filetype=scss.css
		au BufRead,BufNewFile *.jsm set filetype=javascript

		" set tab completion on css-classes
		au FileType scss,css,html setlocal iskeyword+=-

		" delimitmate custom matches
		au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

		" custom matchit pairs b:match_words
		autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'
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

		" smart show cursorline
		autocmd WinEnter    * set cursorline
		autocmd WinLeave    * set nocursorline
		autocmd InsertEnter * set nocursorline
		autocmd InsertLeave * set cursorline
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
