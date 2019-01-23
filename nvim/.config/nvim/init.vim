set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set termguicolors

let g:loaded_python_provider = 1 " disable python2 plugins
let g:loaded_ruby_provider = 1   " disable ruby plugins

let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.vimrc
