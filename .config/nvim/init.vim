" Plug-Ins {{{
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-sandwich'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
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
set hidden
set nobackup nowritebackup
set cmdheight=2
set updatetime=30
" Don't pass messages to |ins-completion-menu|
set shortmess+=c
set signcolumn=yes
set inccommand=split
set ignorecase smartcase
set tildeop
set wrap linebreak nolist
set statusline &vim
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set number relativenumber
set foldmethod=marker
set termguicolors
" }}}

" Plug-In Settings {{{
let g:user_emmet_install_global = 0
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
nnoremap <silent> <leader>d a<C-R>=strftime('%Y-%m-%d')<CR><ESC>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>gg :edit $TODO<CR>
nnoremap <silent> <leader>gv :edit $MYVIMRC<CR>
nnoremap <silent> <leader>m :Goyo<CR>
nnoremap <silent> <leader>n :make<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatting selected code.
xmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" }}}

" Insert Mode {{{
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
" }}}
" }}}

" Functions {{{
function! TrimWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

" Autocommands {{{
augroup Cleaning
  autocmd!
  autocmd BufWritePre * call TrimWhiteSpace()
augroup end
augroup CoCAutos
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" }}}

" vim: set foldmethod=marker foldlevel=0:
