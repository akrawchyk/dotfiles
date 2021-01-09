filetype plugin indent on
set ignorecase
set nowrap
set number
set et sw=2
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set termguicolors
set cursorline

highlight link ExtraWhitespace Error

" yank until end of line
noremap Y y$

augroup vim
  autocmd!

  autocmd BufWritePost .nvimrc source $MYVIMRC
augroup END

augroup editing
  autocmd!

  " only show linenumbers on current window
  autocmd WinEnter * setl number
  autocmd WinEnter * setl cursorline
  autocmd WinLeave * set nonumber
  autocmd WinLeave * set nocursorline

  " show extra whitespace as red
  au BufWinEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhitespace /\s\+$/
  au BufWinLeave * call clearmatches()
augroup END

call plug#begin(stdpath('data') . '/plugged')
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

colorscheme base16-onedark
