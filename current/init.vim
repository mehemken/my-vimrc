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

" Solidity syntax highlighting
Plug 'tomlion/vim-solidity'

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
set laststatus=2
set wrap
set linebreak
set nolist            " list diables linebreak
"set path+=**         " search for files in subdirectories
set path=**,*         " search for files in subdirectories
set rnu
set nu
set shiftwidth=4
set sidescroll=5
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set wildmenu         " search for a file from substring
set wrap

" -- split navigations --
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" -- remaps --
nnoremap ; :
nnoremap : ;
nnoremap 0 ^
nnoremap ^ 0
inoremap <tab> <esc>`^

" -- Abbreviations --
" Ultimately, this one was nice at times, but too often I just
" want to open and close curly braces on the same line.
"iab { {<CR>}<Esc><Up>

" -- Terminal behavior --
tnoremap <C-o> <C-\><C-N>
au TermOpen * setlocal nonumber norelativenumber
" Highlights terminal cusor
hi! TermCursorNC ctermfg=15 ctermbg=14
" <below> Allows pasting of registers with <A-r>
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'

" -- Syntax highlighting --
autocmd filetype yaml 
    \ setlocal ts=2 sts=2 sw=2 expandtab |
    "\ hi colorcolumn ctermbg=White guibg=firebrick3
    "\ set colorcolumn=81 |

"autocmd filetype python
    "\ hi colorcolumn ctermbg=White guibg=firebrick3
    "\ set colorcolumn=81 |

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
nnoremap cot :call NewTermTab()<enter>
nnoremap con :NERDTreeToggle<enter>
nnoremap cog :call GTFOWindowsLineEndings()<enter>
nnoremap cos :source ~/.config/nvim/init.vim<enter>

" FZF
nnoremap cop :Files<enter>
nnoremap cob :Buffers<enter>

"  --- Terraform
nnoremap cohf :call TerraformFmt()<enter>L

"  --- Pomodoro

nnoremap copa :call StartWork()<enter>
nnoremap copb :call AddDate()<enter>
nnoremap copd :call StopWork()<enter>
nnoremap cope :call NewEstimate()<enter>
nnoremap coph :call RandomHex()<enter>
nnoremap copn :call OpenNotes()<enter>
nnoremap copp :call MadeProgress()<enter>

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

" -- Generate Random Hex --
function! RandomHex()
    :norm o
    :.!python3 -c 'import secrets; print(secrets.token_hex(5))'
    :norm A=x: 
endfunction

" -- Start working on --
function! StartWork()
    :norm A%% <==
endfunction

" -- Stop work on --
function! StopWork()
    :norm 0f%
    :norm D
    :norm Ax
endfunction

" -- New Estimate --
function! NewEstimate()
    :norm A|n|
    :norm $Fn
endfunction

" -- Made Progress --
function! MadeProgress()
    :norm ogroup.....=1:
endfunction

" -- OpenNotes --
" OpenNotes copies the word under the cursor and opens the file:
" task_notes/FILE.md
function! OpenNotes()
    :norm "ayiw
    let @a = "tabedit " . "task_notes/" . @a . ".md"
    :execute @a
endfunction

" -- AddDate --
function! AddDate()
    :norm o
    :.!date '+\%d \%B \%Y'
    :norm kJ
endfunction

" -- TerraformFmt --
function! TerraformFmt()
    :.!terraform fmt %
endfunction

