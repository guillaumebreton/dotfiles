
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on
filetype on
filetype plugin on
filetype indent on

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Set longer history
set history=1000
" Enable shell completion
set wildmenu

" Enable auto indent
set autoindent

"Set terminal title
set title
set autoread

" Set defautl encoding
set encoding=utf8

" Color schemes
colorscheme railscasts

" display the status line always
set laststatus=2
set statusline+=%m

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab as wide as two spaces
set tabstop=2

" Show line
set ruler
set cursorline

" make backspace work like other app
set backspace=2

" enable mouse in all mode
set mouse=a

" Use os clipboard by default
set clipboard=unnamedplus,unnamed,autoselect

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

" Control  plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\vendor$\',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jar,*/target/*,*.class,*/vendor/*

if has("autocmd")
	filetype on
	" md, markdown, and mk are markdown and define buffer-local preview
	au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

	" add json syntax highlighting
	au BufNewFile,BufRead *.json set ft=javascript
endif

" more natural split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Scroll the viewport faster

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set shortmess=atI
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title
