" Plug-Ins {{{
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-sandwich'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" Colorscheme {{{
if !(&t_Co > 1)
  syntax off
elseif &t_Co > 255
  colorscheme gruvbox
else
  colorscheme default
endif
" }}}

" Settings {{{
" Built-in Settings {{{
set inccommand=split
set ignorecase smartcase
set tildeop
set wrap linebreak nolist
set number relativenumber
set foldmethod=marker
set termguicolors
" }}}

" Plug-In Settings {{{
call neomake#configure#automake('w')
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }
" }}}
" }}}

" Mappings {{{
let mapleader = " "
let maplocalleader = "  "

" Normal Mode {{{
nnoremap Y y$
nnoremap <silent> <leader><CR> :noh<CR>
nnoremap <silent> <leader>d    a<C-R>=strftime('%Y-%m-%d')<CR><ESC>
nnoremap <silent> <leader>ff   :Files<CR>
nnoremap <silent> <leader>gg   :edit $TODO<CR>
nnoremap <silent> <leader>gv   :edit $MYVIMRC<CR>
nnoremap <silent> <leader>m    :Goyo<CR>
nnoremap <silent> <leader>n    :make<CR>
nnoremap <silent> <leader>pc   :PlugClean<CR>
nnoremap <silent> <leader>pi   :PlugInstall<CR>
nnoremap <silent> <leader>pu   :PlugUpdate<CR>
" }}}
" }}}
" vim: set foldmethod=marker foldlevel=0:
