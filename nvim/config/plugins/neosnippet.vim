let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }

function! s:neosnippet_complete()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable() 
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<tab>"
  endif
endfunction
imap <C-c> <Plug>(neosnippet_expand_or_jump)
