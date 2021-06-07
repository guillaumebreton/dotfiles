

if executable('gofmt')
  let g:neomake_go_gofmt_maker = {
          \ 'exe': 'gofmt',
          \ 'args': ['-w'],
          \ 'errorformat':
              \ '%f:%l:%c: %m,' .
              \ '%-G%.%#'
      \ }
endif

if executable('goimports')
  let g:neomake_go_goimports_maker = {
          \ 'exe': 'goimports',
          \ 'args': ['-w'],
          \ 'errorformat':
              \ '%f:%l:%c: %m,' .
              \ '%-G%.%#'
      \ }
endif


let g:neomake_go_enabled_makers         = ['gofmt', 'goimports', 'go']
let g:neomake_open_list   = 2
let g:neomake_list_height = 5
let g:neomake_verbose     = 0


hi NeomakeError ctermfg=white ctermbg=red
hi NeomakeWarning ctermfg=white ctermbg=yellow

" autocmd! BufWritePost * Neomake
command Errors lopen


autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

function! s:Neomake_callback(options)
    if(a:options.status == 0)
        edit
        checktime
    endif
endfunction

" autocmd BufUnload * lclose
 
