"============================================================[ Install ]============================================================"

call jetpack#begin()
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'b4b4r07/vim-shellutils'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'matze/vim-move'
  Jetpack 'mbbill/undotree'
  Jetpack 'phodge/vim-shell-command'
  Jetpack 'preservim/nerdtree'
  Jetpack 'reireias/vim-cheatsheet'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'thinca/vim-quickrun'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-fugitive'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
  Jetpack 'Xuyuanp/nerdtree-git-plugin'
call jetpack#end()
let g:jetpack#optimization=2

"============================================================[ Settings ]============================================================"

" AutoSave
let g:auto_save = 1
let g:auto_save_silent = 1

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left':  [ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
\ }

" move
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" NERDTree
" Show hidden files
let NERDTreeShowHidden = 1

" NERDTree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'!',
  \ 'Staged'    :'+',
  \ 'Untracked' :'?',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'~',
  \ 'Deleted'   :'✖',
  \ 'Unknown'   :'?',
  \ }
let g:NERDTreeGitStatusConcealBrackets = 1

" vim-gitgutter
" Being enabled highlighting when it's launched
let g:gitgutter_highlight_lines = 1
" The time to reflect when it stops typing
set updatetime=10
" The color of symbols
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=red

" vim-shell-command
let g:shell_command_use_col = 0
