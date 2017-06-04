let g:neomake_verbose = 3


let g:neomake_go_gofmt_maker = {
        \ 'exe': 'gofmt',
        \ 'args': ['-w'],
        \ 'errorformat':
            \ '%f:%l:%c: %m,' .
            \ '%-G%.%#'
    \ }

" let g:neomake_go_gobuild_maker = {
"     \ 'exe': 'sh',
"     \ 'args': ['-c', 'go build -o /dev/null ./\$0', '%:h'],
"     \ 'errorformat':
"         \ '%W%f:%l: warning: %m,' .
"         \ '%E%f:%l:%c:%m,' .
"         \ '%E%f:%l:%m,' .
"         \ '%C%\s%\+%m,' .
"         \ '%-G#%.%#'
" \ }

let g:neomake_go_enabled_makers         = ['gofmt', 'go']
let g:neomake_open_list   = 2
let g:neomake_list_height = 5
let g:neomake_verbose     = 0


" autocmd! BufWritePost * Neomake
command Errors lopen


autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

function! s:Neomake_callback(options)
    if(a:options.status == 0)
        edit
        checktime
    endif
endfunction
 
