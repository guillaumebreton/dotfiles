"Plugin install
call plug#begin('~/.vim/plugged')
Plug 'jelera/vim-javascript-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
" Plug 'https://github.com/kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'crusoexia/vim-monokai'
Plug 'mattn/emmet-vim'
call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set t_Co=256
set laststatus=2
colorscheme monokai

set nocompatible              " be iMproved, required
filetype off                  " required


" Mouse control
set mouse=a
set ruler

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
filetype plugin indent on    " required
syntax on
filetype on
filetype plugin on
filetype indent on

" No save backup by .swp
set nowb
set noswapfile
set noar

" disable sound
set visualbell
set noerrorbells

" Delete all whitespace in end of line
autocmd BufWritePre * :%s/\s\+$//e

" enable relative number toggling
set number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Hightlight
if has("autocmd")
	filetype on
	" md, markdown, and mk are markdown and define buffer-local preview
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

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
set wildignore+=*/deps/*

"Folding settings
" set foldenable
" set foldmethod=syntax
" set foldcolumn=0
" set foldlevel=0
" set foldminlines=3
" set foldnestmax=5
" set foldlevelstart=1
"
set clipboard=unnamedplus,unnamed


" Hide highlight
nnoremap <F3> :noh<CR>

nnoremap <c-p> :FZF<cr>
