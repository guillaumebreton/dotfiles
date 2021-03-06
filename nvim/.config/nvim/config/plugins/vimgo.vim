augroup GoAutoCmd
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_operators = 1
  let g:go_def_mapping_enabled = 0
  let g:go_fmt_autosave=0 " Let Neomake do the work
  let g:go_def_mode = 'godef'


  "Binding
autocmd FileType go nnoremap <silent> <C-p> :GoDefPop<cr>
autocmd FileType go nnoremap <silent> <C-g> :GoDef<cr>
autocmd FileType go noremap <silent> <leader>t <Esc>:w<CR>:GoTest<cr>
augroup END

set ttimeout
set ttimeoutlen=0
noremap <silent> <C-t> :Files<cr>
