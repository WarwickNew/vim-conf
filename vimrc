" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78
  autocmd FileType dotoo,org,tex,text setlocal textwidth=80
  autocmd FileType dotoo,org,tex,text setlocal linebreak
  autocmd FileType dotoo,org,tex,text setlocal spell spelllang=en_gb


augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" :W sudo saves the file when the file is open in readonly mode
command W w !sudo tee % > /dev/null

set number
set expandtab
" 1 tab = 2 spaces
set tabstop=4 shiftwidth=4
set smarttab
set autoindent
" Ignore case when searching
set ignorecase
set smartcase
" highlight search results (after pressing Enter)
set hlsearch
" highlight all pattern matches WHILE typing the pattern
set incsearch
" show the mathing brackets
set showmatch
" Create backup directory if it doesn't exist
silent !mkdir ~/.cache/vim > /dev/null 2>&1
" tell vim where to put its backup files
set backupdir=~/.cache/vim
set undodir=~/.cache/vim
set dir=~/.cache/vim

" set colors
if has("termguicolors")
  set termguicolors
endif
colorscheme desert
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
" highlight current line
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=8 guibg=#404040
hi Cursor ctermbg=15
" set spellcheck
"set spell

" Leader mapping
let mapleader = "\<Space>"
nnoremap <Leader>? :echon " n :Lex \n l? lsp help (if implemented in buffer)"<CR>
nnoremap <Leader>n :Lex<CR>
" Load Plugins
so ~/.vim/plugins.vim
