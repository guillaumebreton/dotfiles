let g:neoformat_only_msg_on_error = 1
let g:neoformat_enabled_js = ['js-beautify']
let g:neoformat_enabled_json = ['jq']
if has("autocmd")
  filetype on

  augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
  augroup END
endif

