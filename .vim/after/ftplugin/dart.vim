setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal expandtab

nmap <leader>fd :CocCommand flutter.devices<cr>
nmap <leader>fq :CocCommand flutter.dev.quit<cr>
nmap <leader>fe :CocCommand flutter.emulators<cr>
nmap <leader>fr :CocCommand flutter.dev.hotReload<cr>
nmap <leader>fR :CocCommand flutter.dev.hotRestart<cr>

highlight CursorColumn ctermbg=green ctermfg=white
