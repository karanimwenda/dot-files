setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab

nmap <leader>td :Termdebug<cr>
nmap <leader>tc :Continue<cr>
nmap <leader>tC :Clear<cr>
nmap <leader>tb :Break<cr>
" tmap <F1> <C-W><C-W><C-W><C-W><C-W>L<C-W>W
tmap <C-W>a <C-W>W<C-W>L
let g:termdebug_wide=1
