function! customize#after() abort
  " commonly capitalized commands
  cnoremap W w
  cnoremap Wq wq
  cnoremap Q q

  " make undo and yank consistent
  nnoremap U <C-r>
  noremap Y y$

  " jump to last edited file with BS
  nnoremap <BS> <C-^>

  " javascript syntax detection
  autocmd BufNewFile,BufRead *.{js,mjs,jsm,es,es6},Jakefile setfiletype javascript

  " dont show errors list
  let g:neomake_open_list = 0
endfunction
