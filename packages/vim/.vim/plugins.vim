"============================================================[ Jetpack ]============================================================"

let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'matze/vim-move'
  Jetpack 'mbbill/undotree'
  Jetpack 'preservim/nerdtree'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'tani/vim-jetpack'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
  Jetpack 'Xuyuanp/nerdtree-git-plugin'
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

"============================================================[ Settings ]============================================================"

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

" AutoSave
let g:auto_save = 1
let g:auto_save_silent = 1

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

" Pencil
let g:pencil_gutter_color = 1

"============================================================[ Aliases ]============================================================"

command Fw FixWhitespace
command Nt NERDTreeToggle
command Ut UndotreeToggle
