" C++
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype h setlocal expandtab tabstop=2 shiftwidth=2

" Python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END
