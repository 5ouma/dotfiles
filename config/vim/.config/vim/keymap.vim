" Redo
nnoremap r <C-r>

" Search
nnoremap <silent> <Esc> :nohlsearch<Return>

" Tab
nnoremap <silent> to :tabedit<Return>:Files<Return>
nnoremap <silent> tq :tabclose<Return>
nnoremap <silent> th :tabprevious<Return>
nnoremap <silent> tl :tabnext<Return>

" Window
nnoremap <silent> ss :split<Return>
nnoremap <silent> sv :vsplit<Return>
nnoremap sq <C-w>q
nnoremap <Space> <C-w>w
nnoremap <S-Space> <C-w><S-w>
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sj <C-w>j

" Move Lines
nmap <S-k> <A-k>
nmap <S-j> <A-j>

" Asyncomplete
inoremap <Return> asyncomplete#close_popup()

" autoformat
nnoremap af :Autoformat<Return>

" fzf.vim
nnoremap <silent> ff :Files<Return>
nnoremap <silent> gf :GFiles?<Return>

" NerdTree
nnoremap <silent> nt :NERDTreeToggle<Return>
