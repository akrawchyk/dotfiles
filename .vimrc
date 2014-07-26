" Andrew Krawchyk
" Options are organized similarly to the :options command
"
"--- important {{{
set nocompatible
"--- }}}


"---- plugins {{{
filetype off
syntax off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"------ tools {{{
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-dispatch'
Plugin 'terryma/vim-expand-region'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-repeat'
Plugin 'justinmk/vim-sneak'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
"------ }}}

"------ css {{{
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
"------ }}}

"------ html {{{
Plugin 'othree/html5.vim'
Plugin 'Valloric/MatchTagAlways'
"------ }}}

"------ git {{{
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
"------ }}}

"------ javascript {{{
Plugin 'nono/vim-handlebars'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'marijnh/tern_for_vim'
"------ }}}

"------ php {{{
"------ }}}

"------ python {{{
Plugin 'klen/python-mode'
"------ }}}

"------ ruby {{{
"------ }}}

"------ rails {{{
"------ }}}

"------ colors {{{
Plugin 'chriskempson/base16-vim'
"------ }}}

call vundle#end()
filetype plugin indent on
syntax on
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
set winheight=5
set winminheight=2
set winwidth=5
set winminwidth=5
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
set completeopt=menuone
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
set wildignore+=*.DS_Store
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildignore+=*.exe,*.dll,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*
set wildignore+=*/.sass-cache/*,*/bower_components/*,*/node_modules/*
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
	let g:ackprg = 'ag --nogroup --column'
endif
"------ }}}

"------ airline {{{
let g:airline_theme = 'tomorrow'
"------ }}}

"------ delimitMate {{{
let g:delimitMate_expand_cr = 1
"------ }}}

"------ html-indent {{{
let g:html_indent_inctags = 'head,body,main,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1  = 'inc'
"------ }}}

"------ indent guides {{{
let g:indent_guides_start_level = 2
"------ }}}

"------ javascript {{{
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
"------ }}}

"------ javascript-libraries-syntax {{{
let g:used_javascript_libs = 'angularjs,jasmine,jquery,requirejs'
"------ }}}

"------ MatchTagAlways {{{
let g:mta_filetypes = {
			\ 'html'       : 1,
			\ 'xhtml'      : 1,
			\ 'xml'        : 1,
			\ 'jinja'      : 1,
			\ 'handlebars.html' : 1
			\}
"------ }}}

"------ NERDTree {{{
let g:NERDTreeChDirMode  = 2
let g:NERDTreeQuitOnOpen = 1
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
let g:syntastic_mode_map = {
			\ 'mode' : 'passive',
			\ 'active_filetypes' : ['javascript'],
			\ 'passive_filetypes' : []
			\ }
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

" quit files with <leader>q
noremap <leader>q :q<cr>

" save files with <leader>s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>


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

"------ NERDTree {{{
map <leader>n :NERDTreeToggle<CR>
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

		" open NERDTree automatically if no files are specified
		au VimEnter * if !argc() | NERDTree | endif
	augroup END

	augroup filetypes
		au!

		" fix html indenting
		au FileType html setlocal indentkeys-=*<Return>

		" set xml formatting command to xmllint
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

		" set custom indentation
		au FileType html,php,handlebars.html,scss setlocal sts=4 sw=4 et
		au FileType javascript setlocal sts=2 sw=2 et

		" set tab completion on css-classes
		au FileType scss,css,eruby,haml,html setlocal iskeyword+=-

		" surround custom replacements
		au FileType eruby let b:surround_45 = "<% \r %>"
		au FileType eruby let b:surround_61 = "<%= \r %>"
		au FileType eruby let b:surround_92 = "<%# \r %>"
		au FileType html,eruby let b:surround_100 = "<div>\r</div>"
		au FileType html,eruby let b:surround_112 = "<p>\r</p>"
		au FileType html,eruby let b:surround_115 = "<span>\r</span>"

		" delimitmate custom matches
		au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
	augroup END

	augroup editing
		au!

		au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

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

"---- gui {{{
colorscheme base16-ocean
let &colorcolumn=80
highlight ColorColumn ctermbg=10 guibg=yellow

highlight ExtraWhitespace ctermbg=196 guibg=red

highlight SyntasticErrorSign ctermbg=210 ctermfg=160
highlight SyntasticWarningSign ctermbg=227 ctermfg=166
" highlight SyntasticWarningLine ctermbg=227 ctermfg=166
" highlight SyntasticErrorLine ctermbg=210 ctermfg=160
"---- }}}
