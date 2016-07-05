"-----------------------------------------------------------------------------
"  I. Plugins
"-----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" Commentary plugin
Plug 'tpope/vim-commentary'

" Surround (cs"')
Plug 'tpope/vim-surround'

" All usage of multiple cursor
Plug 'terryma/vim-multiple-cursors'

" Autocomplete
Plug 'Shougo/deoplete.nvim'

" Auto pair quote brakets etc
" Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'

" Snippets management
Plug 'Shougo/neosnippet'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'markcornick/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
Plug 'keith/tmux.vim'

" Misc plugins
Plug 'vimwiki/vimwiki'

" Colorshemes
Plug 'crusoexia/vim-monokai'
" Hybrid
Plug 'w0ng/vim-hybrid'
" Badwolf
Plug 'sjl/badwolf'
" Molokai
Plug 'tomasr/molokai'
" Iceberg
Plug 'cocopon/iceberg.vim'
" Tender
Plug 'jacoborus/tender.vim'
" Base 16
Plug 'chriskempson/base16-vim'


call plug#end()

"-----------------------------------------------------------------------------
"  II. Setttings
"-----------------------------------------------------------------------------
colorscheme monokai
set t_Co=256
set laststatus=2

set nocompatible              " be iMproved, required:
filetype off                  " required


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
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Replace tab by space in insert mode
set expandtab

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
autocmd BufWritePre * :%s/\s\+$//e

" enable relative number toggling
set number

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
" White characters settings
"-----------------------------------------------------------------------------
" set list                                    " Show listchars by default
" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·

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
endif

"Ignore a lot of stuff
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*
set wildignore+=*/vendor/*
set wildignore+=*/node_nodules/*
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

" Don't look selection when shifting
xnoremap <  <gv
xnoremap >  >gv

"-----------------------------------------------------------------------------
"  III. Mappings
"-----------------------------------------------------------------------------
let mapleader = "\<SPACE>"


"-----------------------------------------------------------------------------
" Disable arrow key, space and ex mode
"-----------------------------------------------------------------------------
" nnoremap <up> <NOP>
" nnoremap <down> <NOP>
" nnoremap <left> <NOP>
" nnoremap <right> <NOP>
" nnoremap <bs> <NOP>
" nnoremap <delete> <NOP>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>


" Easy window motion
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>

" Hide highlight
nnoremap <F3> :noh<CR>

" n search forward and N back ard
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" quickly add blanck line
nmap <leader>[  :put! =''<cr>
nmap <leader>]  :put =''<cr>

" Quick fold
nmap <leader>f  za

" Enter visual mod
nmap <Leader><Leader> V

" Move the end of the pasted line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Y act like D, etc
nnoremap Y y$

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" Quickly edit the configuration file
nmap <leader>c :tabedit ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost vimrc source ~/.config/nvim/init.vim

" Print current date
nmap <Leader>d :r! date "+\%Y-\%m-\%d"<cr>
nmap <Leader>t :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<cr>

" Move line back and forth
nmap <leader>e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap <leader>e  :<c-u>execute 'move +'. v:count1<cr>

" Remap page up/down to Ctrl-J/K
nmap <C-J> <C-F>
nmap <C-K> <C-B>

"multi cursor mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" in n vim set the cursor depnding on type
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

" Launch fzf
let g:go_def_mapping_enabled = 0
let g:fzf_buffers_jump = 1

nnoremap <C-t> :FZF<cr>
au BufRead,BufNewFile *.md setlocal textwidth=80

"-----------------------------------------------------------------------------
"  IV. Plugins configuration
"-----------------------------------------------------------------------------
" Snippet configuration
let g:neosnippet#snippets_directory = "~/.config/nvim/snippets"
let g:neosnippet#disable_runtime_snippets = { "_": 1, }

"deoplete enabled at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']

" If the deoplete menu is opened, select next item
" else if this a neosnippet expand it
" else insert a tab
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

" If deoplete menu opened, select the item and expand it with neosnippet
" else insert a CR
" function! s:neosnippet_exec()
"   if pumvisible()
"     return deoplete#close_popup()."\<Plug>(neosnippet_expand)"
"   else
"     return "\<CR>"
"   endif
" endfunction

" inoremap <silent><expr><CR> <SID>neosnippet_exec()
" imap <expr><TAB> <SID>neosnippet_complete()
" inoremap <silent><expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
	\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup())
		\ :  "\<CR>"

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><TAB> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete()))

smap <silent><expr><TAB> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete()))

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

" Setup vim wiki as markdown
let g:vimwiki_list = [{'path': '~/wiki/',
                       \ 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}]
