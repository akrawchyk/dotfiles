" Options are organized similarly to the :options command
"

" create expected directories
if isdirectory('.') && !isdirectory('~/.vim/tmp')
  silent execute '!mkdir -p $HOME/.vim/tmp'
endif

"--- important {{{
"--- }}}

"---- plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif

packadd! matchit

call plug#begin()

"------ colors {{{
Plug 'chriskempson/base16-vim'
"------ }}}

"------ tools {{{
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/csv.vim'
Plug 'Raimondi/delimitMate'
Plug 'rhysd/devdocs.vim'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Valloric/YouCompleteMe', { 'do': 'chmod +x ./install.py; python ./install.py --tern-completer' }
"------ }}}

"------ javascript {{{
Plug 'othree/javascript-libraries-syntax.vim'
"------ }}}

"------ typescript {{{
Plug 'Quramy/tsuquyomi'
"------ }}}

"------ ruby {{{
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'
"------ }}}

call plug#end()
"---- }}}

"--- moving around, searching and patterns {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
if executable('rg')
  set grepprg=rg\ -H\ --no-heading\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
"--- }}}

"--- tags {{{
"--- }}}

"--- displaying text {{{
set display=lastline
set lazyredraw
set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:˒ ,trail:·,extends:…,precedes:…,nbsp:+'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif
set nowrap
"--- }}}

"--- syntax, highlighting and spelling {{{
set background=dark
set synmaxcol=200
if has('termguicolors')
  set termguicolors
endif
"--- }}}

"--- multiple windows {{{
set hidden
set laststatus=2
set splitbelow
set splitright
"--- }}}

"--- multiple tab pages {{{
"--- }}}

"--- terminal {{{
set ttyfast
set scrolljump=4
"--- }}}

"--- using the mouse {{{
"--- }}}

"--- printing {{{
"--- }}}

"--- messages and info {{{
set ruler
set report=0
set showcmd
set shortmess=aoOtI
set showmode
"--- }}}

"--- selecting text {{{
set clipboard=unnamed
"--- }}}

"--- editing text {{{
set backspace=indent,eol,start
set complete-=i
set completeopt=menu,menuone
set undofile
set undodir^=$HOME/.vim/tmp//
"--- }}}

"--- tabs and indenting {{{
set autoindent
set shiftround
"--- }}}

"--- folding {{{
set foldmethod=marker
set foldopen+=jump
"--- }}}

"--- diff mode {{{
"--- }}}

"--- mapping {{{
"--- }}}

"--- reading and writing files {{{
set backup
set backupdir^=$HOME/.vim/tmp//
set backupext=.bak
set autoread
"--- }}}

"--- the swap file {{{
set directory^=$HOME/.vim/tmp//
set updatecount=100
"--- }}}

"--- command line editing {{{
set wildmode=longest:full,full
set wildignore+=tags,*.pyc
set wildmenu
"--- }}}

"--- executing external commands {{{
set shell=/usr/local/bin/zsh
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
set viminfo='100,n$HOME/.vim/tmp/viminfo
"--- }}}

"--- term {{{
set t_Co=256
"--- }}}


"---- plugin settings {{{

"------ airline {{{
let g:airline_theme = 'base16_eighties'

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
let g:airline#extensions#branch#displayed_head_limit = 8
"------ }}}

"------ ale {{{
let g:ale_echo_msg_format = '[%linter%:%severity%] %code: %%s'
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'ruby': ['rubocop']
      \}
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--single-quote --no-semi --no-trailing-comma --print-width 100'
let g:ale_writegood_use_global = 1
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ devdocs {{{
let g:devdocs_filetype_map = {
      \ 'ruby': 'rails',
      \ 'javascript.jsx': 'react'
      \ }
"------ }}}

"------ editorconfig {{{
" https://github.com/editorconfig/editorconfig-vim#recommended-options
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"------ }}}

"------ fzf {{{
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \}
" https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L206
" Command for git grep
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
" Augmenting Rg command using fzf#vim#with_preview function
if executable('rg')
  command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
end

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"------ }}}

"------ javascript-libraries-syntax {{{
let g:used_javascript_libs = 'jquery,underscore,angularjs,angularuirouter,react,vue'
"------ }}}

"------ vim-ruby {{{
let ruby_operators = 1
" let ruby_space_errors = 1
let ruby_no_expensive = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1 " FIXME
" let g:rubycomplete_load_gemfile = 1 " FIXME
"------ }}}

"------ surround {{{
let g:surround_indent = 1
"------ }}}

"------ supertab {{{
let g:SuperTabDefaultCompletionType = '<C-n>'
"------ }}}

"------ UltiSnips {{{
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
"------ }}}

"------ YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
if executable('python3')
  let g:ycm_python_binary_path = 'python3'
endif
"------ }}}
"---- }}}


"---- mappings {{{
" up/down keys to be based on display lines, not physical lines
noremap j gj
noremap k gk

" faster exit insert
inoremap jk <Esc>

" make undo and yank consistent
nnoremap U <C-r>
noremap Y y$
inoremap <C-U> <C-G>u<C-U>

" easier open splits
nnoremap <C-w>- <C-w>s
nnoremap <C-w>\ <C-w>v

" easier split navigating
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" commonly capitalized commands
cnoremap W w
cnoremap Wq wq
cnoremap Q q

" indenting keeps original selection in visual
xnoremap > >gv
xnoremap < <gv

" write file without correct permissions when opened
cnoremap w!! %!sudo tee > /dev/null %

" insert the current directory into a command-line path
cnoremap <C-p> <C-R>=expand('%:p:h') . '/'<CR>

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
xnoremap Q :norm @q<CR>

" move through quickfix and loclist
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" move through buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" move through tabs
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" jump to last edited file with BS
nnoremap <BS> <C-^>

" fixing problems with ALE
nnoremap <F8> <Plug>(ale_fix)


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
noremap <silent><leader>=f gg=G`` :delmarks z<CR>:echo 'Reformatted.'<CR>

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

" toggle tagbar
nnoremap <leader>t :TagbarToggle<CR>

" search for word under cursor
nnoremap <silent><leader>ag :Ag <C-R><C-W><CR>

" fuzzy find files
nnoremap <leader><leader> :Files<CR>
"------ }}}
"---- }}}


"---- autocmds {{{
augroup vim
  au!

  " autosource vimrc on write
  au BufWritePost .vimrc source $MYVIMRC
augroup END

augroup filetypes
  au!

  " set xml formatting command to xmllint
  au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

  " set tab completion on css-classes
  au FileType scss,css,html,haml setlocal iskeyword+=-

  " delimitmate custom matches
  au FileType vim,html,haml let b:delimitMate_matchpairs = '(:),[:],{:},<:>'

  " custom matchit pairs b:match_words
  au FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'

  " quickfix full width bottom
  au FileType qf wincmd J

  " https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport#compiler-plugins
  au FileType ruby compiler ruby

  " https://github.com/rhysd/devdocs.vim#mapping-k-to-search-under-the-word-quickly
  au FileType python,ruby,javascript nnoremap <buffer>K <Plug>(devdocs-under-cursor)
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

  " open quickfix after grep
  au QuickFixCmdPost *grep* cwindow
augroup END
"---- }}}

"---- gui {{{
" set Vim-specific sequences for RGB colors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" same thing, but with escape sequences instead of literals
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight link ExtraWhitespace Error
"---- }}}
