if executable("rg")
    set grepprg=rg\ -i\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|execute s:Ctoggle()|redraw!
    nnoremap \ :Rg<SPACE>
endif
nmap <silent> <leader>w :bw<cr>


