"============================================================[ Paths ]============================================================"

" Where to save history file
set viminfo+=n~/.vim/.viminfo

" Load plugin's settings
source ~/.vim/.plugins.vim

"============================================================[ Theme ]============================================================"

" Color scheme
colorscheme pencil
" Reflect appearance mode when vim is loaded
function! CAP()
  let output =  system("defaults read -g AppleInterfaceStyle")
  if v:shell_error != 0
    set background=light
  else
    set background=dark
  endif
endfunction

"============================================================[ Settings ]============================================================"

" Set character code as UTF-8
set encoding=UTF-8
" Not to make a backup file
set nobackup
" Not to make a swap file
set noswapfile
" Auto reload when the editing file is changed
set autoread
" Being enabled to open even if the buffer is editing
set hidden
" Display inputting commands to the status bar
set showcmd
" Turn off the beep sound
set belloff=all
" Being enabled `forever undo`
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif
" Share clipboard with OS
set clipboard+=unnamed
" Use a mouse
set mouse=a

" Appearance
" Display the line numbers
set number
" Highlight current line
set cursorline
" Being enabled to move the cursor after the end of the lines
set virtualedit=onemore
" Set indents as smart indent
set smartindent
" Highlight the corresponding brackets
set showmatch
" Always display status line
set laststatus=2
" Completion on the command line
set wildmode=list:longest
" Being enabled to move as units of seen lines
nnoremap <Down> gj
nnoremap <Up> gk
" Being enabled the syntax highlight
syntax enable

" Tab
" Make the invisible text visible(Tab is shown as `▸-`)
set list listchars=tab:\▸\-
" Change tab as spaces
set expandtab
" The number of spaces instead of tab
set shiftwidth=2
set tabstop=2

" Search
" Search if the texs are lower case, even if it's upper or lower case
set ignorecase
" Not to search if the texts are upper case
set smartcase
" Sequentially highlight the target string when entering search strings
set incsearch
" Back to the beginning when searching goes to the end
set wrapscan
" Highlight the searching texts
set hlsearch
" Cancel highlighting by typing `esc`
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"============================================================[ Aliases & Keymaps ]============================================================"

command Cl set background=light
command Cd set background=dark
command Fw FixWhitespace
command Nt NERDTreeToggle
command Ut UndotreeToggle

nmap r <c-r>
