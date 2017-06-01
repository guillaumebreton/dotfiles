"-----------------------------------------------------------------------------
"
"
"  I. Plugins
"-----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')


Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }


Plug 'brooth/far.vim'

" Auto pair quote brakets etc
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'markcornick/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'elubow/cql-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'dag/vim-fish'
Plug 'zchee/deoplete-go', { 'do': 'make'}


" Fuzzy finder
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Colorshemes
Plug 'crusoexia/vim-monokai'

" Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-dirvish'

call plug#end()

"-----------------------------------------------------------------------------
"  II. Setttings
"-----------------------------------------------------------------------------
colorscheme monokai
set t_Co=256
set laststatus=2

set nocompatible              " be iMproved, required:
filetype off                  " required

set list!
set listchars=tab:→\ ,trail:·,extends:\#,nbsp:.
" Mouse control
set mouse=a
set ruler

" Make it obvious where 80 column is
" set textwidth=80
set colorcolumn=+1

" hightlight the cursor line
set cursorline

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Set longer history
set history=1000

" Enable shell completion
set wildmenu

" Indent settings
set backspace=2
set autoindent

" Set the number of column a tab counts for
set tabstop=2 " tap appears as 2 space
set shiftwidth=2 " The size of an indent
set softtabstop=2 " set the number of col for a tab
set expandtab " Replace tab by space in insert mode
set smarttab


" Highlight
syntax on
filetype on

" Keep indentation when wrapping lines…
set breakindent

" Wrap lines by words
set linebreak

" No save backup by .swp
set nowb
set noswapfile
set noar


" disable sounds
set visualbell
set noerrorbells

" Auto reload file
set autoread

" Delete all whitespace in end of line
" autocmd BufWritePre * :%s/\s\+$//e

" enable relative number
set number
set relativenumber

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc
"-----------------------------------------------------------------------------
" Search settings
"-----------------------------------------------------------------------------
set hlsearch    " Highlight searches
set ignorecase  " Ignore case of searches
set incsearch   " Highlight dynamically as pattern is typed

"-----------------------------------------------------------------------------
" Split settings (more natural ones)
"-----------------------------------------------------------------------------
set splitbelow  " Splitting a window will put the new window below the current
set splitright  " Splitting a window will put the new window right of the current
"-----------------------------------------------------------------------------
" Filetype settings
"-----------------------------------------------------------------------------
filetype plugin on
filetype indent on


"-----------------------------------------------------------------------------
" Neovim specific settings
"-----------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Hightlight
if has("autocmd")
  filetype on
  " md, markdown, and mk are markdown and define buffer-local preview
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
  au BufRead,BufNewFile *.md setlocal textwidth=80
  au BufRead,BufNewFile *.txt setlocal textwidth=80

  " add json syntax highlighting
  au BufNewFile,BufRead *.json set ft=javascript

  " add rabl as ruby files
  au BufNewFile,BufRead *.rabl set ft=ruby

  autocmd InsertLeave * :set rnu
  autocmd InsertEnter * :set nornu | :set number
endif

"Ignore a lot of stuff
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildignore+=*/deps/*
set clipboard=unnamedplus,unnamed

" ============================================================
" Folding settings
" ============================================================

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable
set foldlevel=0         "this is just what i use

" ============================================================
" Selection settings
" ============================================================

"-----------------------------------------------------------------------------
"  III. Mappings
"-----------------------------------------------------------------------------
let mapleader = "\<SPACE>"

" Disable arrow key, space and ex mode
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>

" Fast quit
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>
nnoremap <Leader>w :wq<cr>

" Moving lines
nnoremap <silent> K :move-2<cr>
nnoremap <silent> J :move+<cr>
xnoremap <silent> K :move-2<cr>gv
xnoremap <silent> J :move'>+<cr>gv

" Moving faster
map <C-j> 10j
map <C-k> 10k

" Don't look selection when shifting
xnoremap <  <gv
xnoremap >  >gv

" Hide highlight
nnoremap <leader>h :noh<CR>

" n search forward and N back ard
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" quickly add blanck line
nmap <leader>[  :put! =''<cr>
nmap <leader>]  :put =''<cr>

" Quick fold
nmap <leader>z  za

" Save
nmap <silent> <Leader><Leader> :w<cr>

" Move the end of the pasted line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Y act like D, etc
nnoremap Y y$

" toggle relative number
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

nmap <leader>n :call NumberToggle()<cr>

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Quickly edit the configuration file
nmap <leader>i :e ~/.config/nvim/init.vim<cr>
nmap <leader>r :source ~/.config/nvim/init.vim<cr>

" Print current date
nmap <Leader>d :r! date "+\%Y-\%m-\%d"<cr>

" in n vim set the cursor depnding on type
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

au BufRead,BufNewFile *.md setlocal textwidth=80

"-----------------------------------------------------------------------------
"  IV. Plugins configuration
"-----------------------------------------------------------------------------
"
"-----------------------------------------------------------------------------
" Nerd tree
"-----------------------------------------------------------------------------
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeAutoDeleteBuffer = 0
" let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
"-----------------------------------------------------------------------------
" FZF
"-----------------------------------------------------------------------------
if executable('fzf')

  " jump to the existing buffer if possible
  let g:fzf_buffers_jump = 1

  " mutiple selection
  let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-t': 'e' }
  nnoremap <buffer> <silent> <C-t> :Files<cr>

  nmap <silent> <silent> <C-m> :History<CR>
  if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  endif
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  " let g:fzf_files_options =
  " \ '--preview "highlight -O ansi {} ;or cat {} 2> /dev/null | head -'.&lines.'"'

endif

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>


function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>



"-----------------------------------------------------------------------------
" EMMET
"-----------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-e>'

"-----------------------------------------------------------------------------
" LEXIMA
"-----------------------------------------------------------------------------
" Lexima
" Make lexima reloadable
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

"-----------------------------------------------------------------------------
" DEOPLETE
"-----------------------------------------------------------------------------
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

"-----------------------------------------------------------------------------
" buftabline
"-----------------------------------------------------------------------------
" Buftab line specific setup
" Cannot bind on ctrl-{digit} because it's reserved by the termiinal emulator
let g:buftabline_show = 1
let g:buftabline_numbers=2
let g:buftabline_indicators=1
let showtabline=0
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>! <Plug>BufTabLine.Go(10)
nmap <leader>@ <Plug>BufTabLine.Go(11)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)

" buftabline gt behavior
nmap gt :bn<cr>
nmap tg :bp<cr>


"-----------------------------------------------------------------------------
" EasyAlign settings
"-----------------------------------------------------------------------------
" easy align
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



"-----------------------------------------------------------------------------
" Neoformat
"-----------------------------------------------------------------------------
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

"-----------------------------------------------------------------------------
" vim-go
"-----------------------------------------------------------------------------
augroup GoAutoCmd
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_operators = 1
  let g:go_def_mapping_enabled = 0
  let g:go_def_mode = 'godef'


  "Binding
  autocmd FileType go nnoremap <silent> <C-p> :GoDefPop<cr>
  autocmd FileType go nnoremap <silent> <C-g> :GoDef<cr>
  autocmd FileType go noremap <silent> <leader>m :GoBuild<cr>
  autocmd FileType go noremap <silent> <leader>t :GoTest<cr>
augroup END

set ttimeout
set ttimeoutlen=0
noremap <silent> <C-t> :Files<cr>

"-----------------------------------------------------------------------------
" RG
"-----------------------------------------------------------------------------
if executable("rg")
    set grepprg=rg\ -i\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|execute s:Ctoggle()|redraw!
    nnoremap \ :Rg<SPACE>
endif
nmap <silent> <leader>w :bw<cr>


"-----------------------------------------------------------------------------
" Quicklist
"-----------------------------------------------------------------------------
let s:quickfixlist_is_open = 0

function! s:Copen()
  copen
  let s:quickfixlist_is_open = 1
  let s:quickfixlist_buffer = bufnr("%")
endfunction

function! s:Cclose()
  if s:quickfixlist_buffer == bufnr("%")
    " We are closing the quickfix window as we are still in it.
    " Return to the window we were previously in (not in the adjascent split)
    execute winnr('#') . "wincmd w"
  endif
  cclose
  let s:quickfixlist_is_open = 0
endfunction

function! s:Ctoggle()
  if s:quickfixlist_is_open
    call s:Cclose()
  else
    call s:Copen()
  endif
endfunction

command! Copen call s:Copen()
command! Cclose call s:Cclose()
command! Ctoggle call s:Ctoggle()

nmap <silent> <C-\> :Ctoggle<cr>
nmap <silent> <C-[> :cprevious<cr>
nmap <silent> <C-]> :cnext<cr>

nmap <Esc> <nop>
