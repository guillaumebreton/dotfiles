" vim: ts=4 sw=4 et
"
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/guillaume/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/guillaume/.dein')
  call dein#begin('/Users/guillaume/.dein')

  " Let dein manage dein
  " Required:
    call dein#add('/Users/guillaume/.dein/repos/github.com/Shougo/dein.vim')


    " General
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-surround')


    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('zchee/deoplete-go', {'build': 'make'})

    " Auto pair quote brakets etc
    call dein#add('cohama/lexima.vim')
    call dein#add('mattn/emmet-vim')

    call dein#add('pangloss/vim-javascript')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('derekwyatt/vim-scala')
    call dein#add('elixir-lang/vim-elixir')
    call dein#add('markcornick/vim-terraform')
    call dein#add('cespare/vim-toml')
    call dein#add('fatih/vim-go', { 'do': ':GoInstallBinaries' })
    call dein#add('elubow/cql-vim')
    call dein#add('posva/vim-vue')
    call dein#add('tpope/vim-surround')
    call dein#add('junegunn/vim-easy-align')
    " call dein#add('editorconfig/editorconfig-vim')
    call dein#add('ekalinin/Dockerfile.vim')
    call dein#add('dag/vim-fish')

    " Fuzzy finder
    call dein#add('/usr/local/opt/fzf') | call dein#add('junegunn/fzf.vim')

    " Colorshemes
    call dein#add('crusoexia/vim-monokai')

    " Misc
    call dein#add('justinmk/vim-dirvish')
    call dein#add('neomake/neomake')
    call dein#add('sbdchd/neoformat')

    call dein#add('Shougo/vinarise.vim')
    call dein#add('ajmwagar/vim-dues')


    call dein#add('brooth/far.vim')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('vim-scripts/Ferret')
    

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
          call dein#install()
endif

filetype plugin indent on
syntax enable


"-----------------------------------------------------------------------------
"  II. Setttings
"-----------------------------------------------------------------------------
colorscheme monokai
" colorscheme dues
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

  " " add json syntax highlighting
  " au BufNewFile,BufRead *.json set ft=javascript

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
" nmap <leader>r :source ~/.config/nvim/init.vim<cr>

" Print current date
nmap <Leader>d :r! date "+\%Y-\%m-\%d"<cr>

" in n vim set the cursor depnding on type
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

au BufRead,BufNewFile *.md setlocal textwidth=80

let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
function! s:source_file(path, ...) abort
	let use_global = get(a:000, 0, ! has('vim_starting'))
	let abspath = resolve(expand('~/.config/nvim/'.a:path))
	if ! use_global
		execute 'source' fnameescape(abspath)
		return
	endif

	let content = map(readfile(abspath),
		\ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
	let tempfile = tempname()
	try
		call writefile(content, tempfile)
		execute printf('source %s', fnameescape(tempfile))
	finally
		if filereadable(tempfile)
			call delete(tempfile)
		endif
	endtry
endfunction


" Quick list 
nmap <silent> <C-n> :cn<CR>
nmap <silent> <C-p> :cp<CR>
nmap <silent> <C-c> :cclose<CR>



" Load all plugins
call s:source_file('config/plugins/buftabline.vim')
call s:source_file('config/plugins/deoplete.vim')
call s:source_file('config/plugins/easyalign.vim')
call s:source_file('config/plugins/emmet.vim')
call s:source_file('config/plugins/lexima.vim')
call s:source_file('config/plugins/neoformat.vim')
call s:source_file('config/plugins/neosnippet.vim')
call s:source_file('config/plugins/rg.vim')
call s:source_file('config/plugins/vimgo.vim')
call s:source_file('config/plugins/fzf.vim')
call s:source_file('config/plugins/neomake.vim')
call s:source_file('config/plugins/ferret.vim')
