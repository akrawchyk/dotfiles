function! customize#after() abort
  " make undo and yank consistent
  nnoremap U <C-r>
  noremap Y y$
endfunction
