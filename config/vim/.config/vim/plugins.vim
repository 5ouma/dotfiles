"============================================================[ Jetpack ]============================================================"

let s:jetpackdir = t:XDG_DATA_HOME .. '/vim'
let s:jetpackfile = s:jetpackdir .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

execute 'source' s:jetpackfile
call jetpack#begin(s:jetpackdir)
  Jetpack '5ouma/vim-colors-pencil'
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'dstein64/vim-startuptime'
  Jetpack 'itchyny/lightline.vim'
  Jetpack 'junegunn/fzf.vim'
  Jetpack 'junegunn/fzf'
  Jetpack 'mattn/vim-lsp-settings'
  Jetpack 'matze/vim-move'
  Jetpack 'obcat/vim-hitspop'
  Jetpack 'pechorin/any-jump.vim'
  Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
  Jetpack 'prabirshrestha/asyncomplete.vim'
  Jetpack 'prabirshrestha/vim-lsp'
  Jetpack 'preservim/nerdtree'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'tani/vim-jetpack'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-fugitive'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
  Jetpack 'vimpostor/vim-lumen'
silent! call jetpack#end()

"============================================================[ Settings ]============================================================"

" any-jump
let g:any_jump_list_numbers = 1
let g:any_jump_grouping_enabled = 1

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
let NERDTreeIgnore = ['.git', '.DS_Store']

" Pencil
let g:pencil_gutter_color = 1

" vim-lsp
let g:lsp_diagnostics_signs_error = {'text': '⃠'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
