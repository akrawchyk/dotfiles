set nocompatible

let mapleader=','
let localmapleader='\'

"---- terminal {{{
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
set backspace=indent,eol,start
set copyindent
set cursorline
set hidden
set laststatus=2
set list
set listchars=""
set listchars+=tab:›\  
set listchars+=trail:·
set listchars+=extends:…
set listchars+=precedes:…
set matchpairs+=<:>
set modelines=0
set nowrap
set number
set numberwidth=1
set ruler
set scrolloff=3
set shortmess=aoOstT
set showmatch
set smartindent
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
set wildignore+=*.sw?
set wildignorecase
set wildmenu
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
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'kana/vim-textobj-user'
" Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-unimpaired'
Bundle 'Shougo/vimproc'
Bundle 'benmills/vimux'
"------ }}}

"------ html {{{
Bundle 'gregsexton/MatchTag'
"------ }}}

"------ javascript {{{
Bundle 'pangloss/vim-javascript'
Bundle 'teramako/jscomplete-vim'
"------ }}}

"------ ruby {{{
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-rvm'
"------ }}}

"------ rails {{{
"Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
"------ }}}

"------ colors {{{
Bundle 'w0ng/vim-hybrid'
Bundle 'gorodinskiy/molokai'
Bundle 'jnurmine/Zenburn'
"------ }}}

filetype plugin indent on
syntax on
"---- }}}

"---- plugin settings {{{
"------ CtrlP {{{
let g:ctrlp_user_command = "find %s -type f | egrep -v '/\.(git|hg|svn)|log|tmp/'"
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ indent guides {{{
let g:indent_guides_start_level = 2
"------ }}}

"------ jscomplete {{{
let g:jscomplete_use = ['dom']
"------ }}}

"------ neocomplcache {{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.

if !exists('g:neocomplcache_omni_functions')
	let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.css = 'csscomplete#CompleteCSS'
let g:neocomplcache_omni_functions.html = 'htmlcomplete#CompleteTags'
let g:neocomplcache_omni_functions.javascript = 'jscomeplete#CompleteJS'
let g:neocomplcache_omni_functions.python = 'pythoncomplete#Complete'
let g:neocomplcache_omni_functions.xml = 'xmlcomplete#CompleteTags'

if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"------ }}}

"------ NERDTree {{{
let NERDTreeChDirMode = 2
let NERDTreeIgnore = [
			\'\.DS_Store$',
			\'\.bundle$','\.git$'
			\]
let NERDTreeHijackNetrw = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
"------ }}}

"------ Powerline {{{
source ~/.vim/bundle/powerline/powerline/ext/vim/powerline.vim
" let g:Powerline_stl_path_style = "filename"
" let g:Powerline_symbols_override = {
" 			\ 'BRANCH': '∓',
" 			\ 'LINE': '#'
" 			\}
"------ }}}

"------ syntastic {{{
" let g:syntastic_javascript_jshint_conf = "camelCase eqeqeq forin latedef newcap noempty nonew undef unused browser jquery"
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

"------ neocomplcache {{{
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
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

"---- gui {{{
"let g:hybrid_use_Xresources = 1
colorscheme hybrid

highlight WhitespaceEOL ctermbg=Red
match WhitespaceEOL /\s\+$/
"---- }}}

"---- autocmds {{{
if has("autocmd")
	augroup vim
		au BufWritePost .vimrc source $MYVIMRC
	augroup END

	augroup filetypes
		" au FileType javascript setl omnifunc=jscomplete#CompleteJS
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
	augroup END

	augroup editing
		au InsertLeave * set nopaste
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
