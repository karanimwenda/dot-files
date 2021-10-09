" vim:foldmethod=marker
" header {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" }}}

" plugins {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'OmniSharp/omnisharp-vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'elkowar/yuck.vim'
Plug 'jwalton512/vim-blade'

" theme plugins
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'

" Initialize plugin system
call plug#end()
" }}}

" plug info {{{
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" }}}

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux. {{{
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}

" colorscheme onedark {{{
" let g:airline_theme = 'onedark'
" }}}

" colorscheme nord {{{
" let g:airline_theme = 'nord'
" }}}

" sonokai {{{
" let g:sonokai_style = 'andromeda'
" colorscheme sonokai
" let g:airline_theme = 'sonokai'
" }}}

" edge theme {{{
let g:edge_style = 'neon'
colorscheme edge
let g:airline_theme = 'edge'
" }}}

" Use gruvbox theme {{{
" autocmd vimenter * ++nested colorscheme gruvbox
" " for neovide
" colorscheme gruvbox
" let g:airline_theme = 'gruvbox'
" }}}

" To show the weird icons in airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" }}}

" general editor settings {{{
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set relativenumber
" Make the status line visible
set laststatus=2
set guifont=Hasklug\ Nerd\ Font:11

packadd termdebug
" }}}

" custom styling {{{
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel ctermbg=darkgreen ctermfg=white
highlight Visual cterm=NONE ctermbg=blue ctermfg=NONE guibg=brown
highlight CursorColumn ctermbg=green ctermfg=NONE
"CursorColumn CocHighlightText CocHighlightRead CocHighlightWrite

" For vertsplit
highlight VertSplit cterm=NONE ctermbg=black ctermfg=blue
" }}}

" nerdtree and ranger {{{
" Since I am not using consolas, change the arrows to these
"let g:NERDTreeDirArrowExpandable="\u00BB"
"let g:NERDTreeDirArrowCollapsible="\u00AB"
" Change colors for the files in NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Close NERDtree on file open
let NERDTreeQuitOnOpen = 1
" Keyboard mapping for NERDTree
nmap <leader>ne :NERDTreeToggle<cr>:NERDTreeRefreshRoot<cr>
nmap <leader>mp <Plug>MarkdownPreviewToggle

nmap <leader>nr :Ranger<cr>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" au VimEnter * NERDTree

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '',
    \ "Unknown"   : "?"
    \ }
" }}}

" buffer, tab and fzf shortcuts {{{
nmap <leader>nh :nohls<cr>
" buffer navigation
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
" buffer funga
nmap <leader>bf :bdelete<cr>
nmap <leader>bD :bdelete!<cr>
command! BufOnly execute '%bdelete|edit #|normal `"'
nmap <leader>bc :BufOnly<cr>

" tabs
nmap <leader>tc :tabnew<cr>
nmap <leader>td :tabclose<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprevious<cr>

" terminal
nmap <leader>tr :terminal<cr>
nmap <leader>ta :tabnew<cr>:terminal<cr>

nmap <leader>ff :Files<cr>
nmap <leader>fg :GFiles<cr>
nmap <leader>fF :Files!<cr>
nmap <leader>fb :BLines<cr>
nmap <leader>fc :BCommits!<cr>
inoremap <Leader>fs <ESC>:Snippets<CR>
" }}}

" uncat {{{
" let g:lightline = {
    " \ 'colorscheme': 'wombat',
    " \ }

let g:UltiSnipsExpandTrigger = "<leader>fu"

" Search but do not jump
nnoremap * :keepjumps normal! mi*`i<CR>

let g:dart_format_on_save = 1

" Disable folding in vim-markdown
let g:vim_markdown_folding_disabled = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>fm :Format<cr>
" }}}

" ale {{{

let g:ale_echo_msg_format = '%linter%: %s'

" Do not lint or fix c++ files.
let g:ale_pattern_options = {
\ '\.cpp$': {'ale_linters': [], 'ale_fixers': []},
\ '\.cc$': {'ale_linters': [], 'ale_fixers': []},
\ '\.h$': {'ale_linters': [], 'ale_fixers': []},
\ '\.java$': {'ale_linters': [], 'ale_fixers': []},
\ '\.php$': {'ale_linters': [], 'ale_fixers': []},
\}

let g:ale_linters = {
\   'c': [], 'cpp': [], 'rust': [], 'go': [], 'python': [], 'sh': [],
\   'html': [], 'css': [], 'javascript': [], 'typescript': [], 'reason': [],
\   'json': [], 'vue': [],
\   'tex': [], 'latex': [], 'bib': [], 'bibtex': [],
\   'cs':['OmniSharp']
\ }
" }}}

" coc.nvim {{{
" ==================================================================================
"                               coc.nvim Config
" ==================================================================================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Setup Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" ==================================================================================
"                               end coc.nvim Config
" ==================================================================================
" }}}
