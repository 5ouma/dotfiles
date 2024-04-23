" Cursor
nnoremap j gj
nnoremap k gk
map n w

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
nnoremap wh <C-w><
nnoremap wl <C-w>>
nnoremap wk <c-W>+
nnoremap wj <C-w>-

" Move Lines
nmap ˚ <A-k>
nmap ∆ <A-j>

" any-jump
nnoremap <silent> aj :AnyJump<Return>

" Asyncomplete
inoremap <Return> asyncomplete#close_popup()

" fzf.vim
nnoremap <silent> ff :Files<Return>
nnoremap <silent> gf :GFiles?<Return>

" NerdTree
nnoremap <silent> nt :NERDTreeToggle<Return>
