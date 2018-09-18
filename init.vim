"  Author:       Marco Hemken
"  email:        mehemken@gmail.com
"  gitlab:       mehemken
"  web:          mehemken.io
"  Description:  Look ma'! No plugins!

" -- Netrw --
let g:netrw_winsize = 20 " Width of window (% of current window)

" -- Tweaks --
set autoindent
set encoding=utf-8
set expandtab
set fileformat=unix
set hlsearch
set laststatus=2
set nolist           " list diables linebreak
set nowrap
"set path+=**         " search for files in subdirectories
set path=**         " search for files in subdirectories
set rnu
set nu
set shiftwidth=4
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
tnoremap <C-o> <C-W>N

"  -- Custom commands --
nnoremap cor :call ClearRegisters()<enter>
nnoremap cop :call PopRegisters()<enter>
nnoremap con :noh<enter>

" -- Syntax highlighting --
autocmd filetype yaml 
    \ setlocal ts=2 sts=2 sw=2 expandtab |
    \ set colorcolumn=81 |
    \ hi colorcolumn ctermbg=White guibg=firebrick3

autocmd filetype python
    \ set colorcolumn=81 |
    \ hi colorcolumn ctermbg=White guibg=firebrick3

au BufRead,BufNewFile *.tfvars setlocal filetype=go
au BufRead,BufNewFile *.tf setlocal filetype=go

highlight badwhitespace ctermbg=red guibg=darkred
au bufread,bufnewfile *.py,*.pyw,*.c,*.h match badwhitespace /\s\+$/

"  -- Clear all registers --
function! ClearRegisters()
    let regs_lower=split('abcdefghijklmnopqrstuvwxyz', '\zs')
    let regs_upper=split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    let regs_numer=split('0123456789', '\zs')
    for r in regs_lower
	call setreg(r, [])
    endfor
    for r in regs_upper
	call setreg(r, [])
    endfor
    for r in regs_numer
	call setreg(r, [])
    endfor
endfunction

" -- Populate registers --
function! PopRegisters()
    call setreg('g', '"ayEj"byEj"cyEj"dyEj"eyEj')
endfunction
