"============================================================[ Jetpack ]============================================================"

let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
  Jetpack '5ouma/vim-colors-pencil'
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'matze/vim-move'
  Jetpack 'mbbill/undotree'
  Jetpack 'obcat/vim-hitspop'
  Jetpack 'preservim/nerdtree'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'tani/vim-jetpack'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
  Jetpack 'Xuyuanp/nerdtree-git-plugin'
call jetpack#end()

"============================================================[ Settings ]============================================================"

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
  \ 'Renamed'   :'→',
  \ 'Unmerged'  :'~',
  \ 'Deleted'   :'×',
  \ 'Unknown'   :'?',
  \ }
let g:NERDTreeGitStatusConcealBrackets = 1

" Pencil
let g:pencil_gutter_color = 1

"============================================================[ Aliases ]============================================================"

command Fw FixWhitespace
command Nt NERDTreeToggle
command Ut UndotreeToggle
