"============================================================[ Jetpack ]============================================================"

let s:jetpackfile = split(&packpath, ',')[0] .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = 'https://raw.githubusercontent.com/5ouma/vim-jetpack/master/plugin/jetpack.vim'
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
  Jetpack '5ouma/vim-colors-pencil'
  Jetpack '5ouma/vim-jetpack'
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'junegunn/fzf.vim'
  Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Jetpack 'mattn/vim-lsp-settings'
  Jetpack 'matze/vim-move'
  Jetpack 'obcat/vim-hitspop'
  Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
  Jetpack 'prabirshrestha/asyncomplete.vim'
  Jetpack 'prabirshrestha/vim-lsp'
  Jetpack 'preservim/nerdtree'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-fugitive'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
  Jetpack 'vimpostor/vim-lumen'
call jetpack#end()

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

" NERDTree
let NERDTreeShowHidden = 1

" Pencil
let g:pencil_gutter_color = 1

" vim-lsp
let g:lsp_diagnostics_signs_error = {'text': '⃠'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}

