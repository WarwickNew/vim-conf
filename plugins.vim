set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

" Pretty
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ShowTrailingWhitespace'
"Plug 'Yggdroot/indentLine'

" Functional
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"Plug 'dhruvasagar/vim-dotoo'
Plug 'vimwiki/vimwiki'
"Plug 'tools-life/taskwiki'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Language C++/glsl
"Plug 'ycm-core/YouCompleteMe'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'mattn/calendar-vim'

call plug#end()


"Always show lightline
set laststatus=2
set showtabline=2
set noshowmode

" Gruvbox colours
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
set background=dark
if has("termguicolors")
    let g:gruvbox_termcolors=256
else
    let g:gruvbox_termcolors=16
endif
"let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_italic=1
colorscheme gruvbox

" Plugin leader mappings

" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" clangd vim lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <Leader>l? :echon " ld lsp-definition \n lrf lsp document reformat \n ls lsp document symbol search \n lS lsp workspace symbol search \n lr lsp references \n li lsp implementation \n lt lsp  type definition \n lj lsp document diagnostics \n lrn lsp rename \n l[g lsp previous diagnostic \n l]g lsp next diagnostic \n lK lsp hover"<CR>
    nmap <buffer> <leader>ld <plug>(lsp-definition)
    nmap <buffer> <leader>lrf <plug>(lsp-document-reformat)
    nmap <buffer> <leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>lr <plug>(lsp-references)
    nmap <buffer> <leader>li <plug>(lsp-implementation)
    nmap <buffer> <leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <leader>lj <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>lrn <plug>(lsp-rename)
    nmap <buffer> <leader>l[g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>l]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>lK <plug>(lsp-hover)
    nmap <buffer> <leader>la <plug>(lsp-code-action-float)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go,*.cpp,*.c,*.h,*.cs,*.js,*.jsx,*.ts call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" C++ Clangd if installed on system already
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['h', 'c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" GLSL
autocmd! BufNewFile,BufRead *.vs,*.fs,*.glsl,*.frag,*.vert set ft=glsl

" Vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'path_html': '~/.vimwiki/HTML',
                      \ 'auto_diary_index': 1,
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'links_space_char': '_',
                      \ 'vimwiki_use_calendar': 1}]
nnoremap <Leader>c :Calendar<CR>

" A little function to insert user input functionality into remaps
function! TagSearch()
    call inputsave()
    let replacement = input('Enter Tag: ')
    call inputrestore()
    execute ':VimwikiSearchTags '.replacement
    execute ':lopen'
endfunction

nmap <Leader>w? :echon " wts search-tags"<CR>
autocmd FileType vimwiki nmap <Leader>wts :call TagSearch()<CR>

" fzf git find
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
