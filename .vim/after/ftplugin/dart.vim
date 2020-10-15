setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal expandtab

nmap <leader>fd :CocCommand flutter.devices<cr>
nmap <leader>fq :CocCommand flutter.dev.quit<cr>

highlight CursorColumn ctermbg=green ctermfg=white
