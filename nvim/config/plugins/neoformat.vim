let g:neoformat_only_msg_on_error = 1
let g:neoformat_enabled_js = ['jq']
let g:neoformat_enabled_go = ['gofmt']
if has("autocmd")
  filetype on

  augroup fmt
      autocmd!
      autocmd BufWritePre *.json Neoformat
      " autocmd BufWritePre *.go Neoformat
  augroup END
endif

