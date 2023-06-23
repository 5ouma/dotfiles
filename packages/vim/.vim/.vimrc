"============================================================[ Paths ]============================================================"

set viminfo+=n~/.vim/.viminfo

source ~/.vim/plugins.vim
source ~/.vim/keymap.vim

"============================================================[ Theme ]============================================================"

colorscheme pencil
function! CAP()
  let output =  system("defaults read -g AppleInterfaceStyle")
  if v:shell_error != 0
    set background=light
  else
    set background=dark
  endif
endfunction

" Aliases
command Cl set background=light
command Cd set background=dark

"============================================================[ Settings ]============================================================"

set encoding=UTF-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set belloff=all
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif
set clipboard+=unnamed
set mouse=a
set updatetime=10

" Appearance
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
syntax enable
set list listchars=tab:→\ ,space:･,eol:↓

" Tab
set expandtab
set shiftwidth=2
set tabstop=2

" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
