" General
nnoremap <silent> qq :q<Return>

" Move to top and bottom
nnoremap <Down> gj
nnoremap <Up> gk

" Redo
nnoremap r <C-r>

" Search
nnoremap <silent> <Esc> :nohlsearch<Return>

" New tab
nnoremap <silent> to :tabedit<Return>:Files<Return>
nnoremap <silent> tq :tabclose<Return>

" Move tab
nnoremap <silent> t<Left> :tabprevious<Return>
nnoremap <silent> t<Right> :tabnext<Return>

" Split window
nnoremap <silent> sh :split<Return>
nnoremap <silent> sv :vsplit<Return>
nnoremap sq <C-w>q

" Move window
nnoremap <Space> <C-w>w
nnoremap <S-Space> <C-w><S-w>
nnoremap s<Left> <C-w>h
nnoremap s<Right> <C-w>l
nnoremap s<Up> <C-w>k
nnoremap s<Down> <C-w>j

" Resize window
nnoremap <C-w><Left> <C-w><
nnoremap <C-w><Right> <C-w>
nnoremap <c-W><uP> <c-W>+
nnoremap <C-w><Down> <C-w>-

" Move Lines
nnoremap <Esc>[1;9A <A-k>
nnoremap <Esc>[1;9B <A-j>

" Asyncomplete
inoremap <Return> asyncomplete#close_popup()

" fzf.vim
nnoremap <silent> ff :Files<Return>
nnoremap <silent> gf :GFiles?<Return>

" NerdTree
nnoremap <silent> nt :NERDTreeToggle<Return>
