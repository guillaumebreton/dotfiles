"deoplete enabled at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer']

imap <expr><TAB> <SID>smart_tab()
imap <silent><expr><CR> <SID>smart_cr()


function! s:smart_cr()
    if pumvisible()
      return "\<C-y>"
    else
      return lexima#expand('<CR>', 'i')
    endif
endfunction

function! s:smart_tab()
    if pumvisible()
      return "\<C-n>"
    " elseif neosnippet#jumpable()
    "   return "\<Plug>(neosnippet_jump)"
    endif
    return "\<TAB>"
endfunction
