function! customize#after() abort
  " make undo and yank consistent
  nnoremap U <C-r>
  noremap Y y$

  " jump to last edited file with BS
  nnoremap <BS> <C-^>

  " javascript syntax detection
  autocmd BufNewFile,BufRead *.{js,mjs,jsm,es,es6},Jakefile setfiletype javascript
endfunction
