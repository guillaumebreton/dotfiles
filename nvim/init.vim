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
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Auto pair quote brakets etc
Plug 'cohama/lexima.vim'
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
Plug 'tpope/vim-surround'
" Plug 'keith/tmux.vim'

" Neomake
" Plug 'neomake/neomake'
" tab replacement
Plug 'ap/vim-buftabline'

" Wiki to manage notes
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
autocmd BufWritePre * :%s/\s\+$//e

" enable relative number
set number
set relativenumber
autocmd InsertLeave * :set rnu
autocmd InsertEnter * :set nornu | :set number

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
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>


" Easy window motion
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
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

" Enter visual mod
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

" Move line back and forth
nmap <leader>e  :<c-u>execute 'move -1-'. v:count1<cr>
nmap <leader>e  :<c-u>execute 'move +'. v:count1<cr>

" Remap page up/down to Ctrl-J/K
nmap <C-j> <C-F>
nmap <C-k> <C-B>

" in n vim set the cursor depnding on type
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

" Launch fzf
let g:go_def_mapping_enabled = 0
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-t': 'e' }
nnoremap <C-t> :FZF -m<cr>
au BufRead,BufNewFile *.md setlocal textwidth=80

"-----------------------------------------------------------------------------
"  IV. Plugins configuration
"-----------------------------------------------------------------------------
let g:user_emmet_leader_key='<C-e>'
" Snippet configuration
let g:neosnippet#snippets_directory = "~/.config/nvim/snippets"
let g:neosnippet#disable_runtime_snippets = { "_": 1, }

" Lexima
" Make lexima reloadable
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

"deoplete enabled at startup
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']

imap <expr><TAB> <SID>smart_tab()
imap <silent><expr><CR> <SID>smart_cr()


function! s:smart_cr()
    if pumvisible()
      if neosnippet#expandable()
         return "\<Plug>(neosnippet_expand)"
      endif
      return "\<C-y>"
    else
      if neosnippet#expandable()
         return "\<Plug>(neosnippet_expand)"
      endif
      return lexima#expand('<CR>', 'i')
    endif
endfunction

function! s:smart_tab()
    if pumvisible()
      return "\<C-n>"
    elseif neosnippet#jumpable()
      return "\<Plug>(neosnippet_jump)"
    endif
    return "\<TAB>"
endfunction


" Setup vim wiki as markdown
let g:vimwiki_list = [{'path': '~/wiki/',
                       \ 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}]


" Buftab line specific setup
let g:buftabline_show = 1
let g:buftabline_numbers=2
let g:buftabline_indicators=1
let showtabline=0
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" buftabline gt behavior
nmap gt :bn<cr>
nmap tg :bp<cr>

nmap <silent> <leader>c :bd<cr>
"multi cursor mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

