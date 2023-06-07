"  Author:       Marco Hemken
"  email:        mehemken@gmail.com
"  gitlab:       mehemken

" =================================
" Plug
" =================================
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Jsonnet Formatting
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }

" ctags using universal-ctags
Plug 'ludovicchabant/vim-gutentags'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" =================================
" </> Plug
" =================================

" fzf
let g:fzf_layout = { 'down': '40%' }

" -- Tweaks --
set autoindent
set encoding=utf-8
set expandtab
set fileformat=unix
set hlsearch
set indentkeys-=0#
set laststatus=2
set linebreak
set mouse=
set nolist            " list diables linebreak
set nu
set path=**,*         " search for files in subdirectories
set shiftwidth=4
set sidescroll=5
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set wildmenu         " search for a file from substring
set wrap
set wrap

" -- split navigations --
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" -- remaps --
nnoremap 0 ^
nnoremap ^ 0
"inoremap <tab> <esc>`^

" -- Terminal behavior --
tnoremap <C-o> <C-\><C-N>
au TermOpen * setlocal nonumber norelativenumber
" Highlights terminal cusor
hi! TermCursorNC ctermfg=15 ctermbg=14
" <below> Allows pasting of registers with <A-r>
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" -- Syntax highlighting --
autocmd filetype yaml 
    \ setlocal ts=2 sts=2 sw=2 | "expandtab |
    \ setlocal indentkeys-=0#

autocmd filetype markdown
    \ setlocal wrap |
    \ setlocal linebreak |
    \ setlocal showbreak=+

au BufRead,BufNewFile *.tfvars setlocal filetype=go
au BufRead,BufNewFile *.tf setlocal filetype=go
au BufRead,BufNewFile *.star setlocal filetype=python
au BufRead,BufNewFile *.jsonnet setlocal filetype=jsonnet

highlight badwhitespace ctermbg=red guibg=darkred
au bufread,bufnewfile *.py,*.pyw,*.c,*.h match badwhitespace /\s\+$/

" ------------- Custom commands -------------

"  --- Generic
nnoremap coc :changes<enter>
nnoremap cof :call setreg('x', @%)<enter>
nnoremap cog :call GTFOWindowsLineEndings()<enter>
nnoremap coj :%!jq .<enter>
nnoremap con :NERDTreeToggle<enter>
nnoremap cod :NERDTreeFind<enter>
nnoremap cos :source ~/.config/nvim/init.vim<enter>
nnoremap cot :call NewTermTab()<enter>

" FZF
nnoremap cop :Files<enter>
nnoremap cob :Buffers<enter>
nnoremap cor :Rg<enter>

" ------------- Functions -------------

" -- NewTermTab --
function! NewTermTab()
    :tabe
    :tabm 0
    :term
endfunction

" -- GTFO Windows Line Endings --
function! GTFOWindowsLineEndings()
    setlocal ff=unix
endfunction
