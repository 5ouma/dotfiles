" Move to top and bottom
map <Down> gj
map <Up> gk

" Redo
map r <C-r>

" Search
map <silent> <Esc> :nohlsearch<Return>

" New tab
map <silent> to :tabedit<Return>
map <silent> tq :tabclose<Return>

" Move tab
map <silent> t<Left> :tabprevious<Return>
map <silent> t<Right> :tabnext<Return>


" Split window
map <silent> sh :split<Return>
map <silent> sv :vsplit<Return>
map sq <C-w>q

" Move window
map <Space> <C-w>w
map <S-Space> <C-w><S-w>
map s<Left> <C-w>h
map s<Right> <C-w>l
map s<Up> <C-w>k
map s<Down> <C-w>j

" Resize window
map <C-w><Left> <C-w><
map <C-w><Right> <C-w>>
map <C-w><Up> <C-w>+
map <C-w><Down> <C-w>-

" Move Lines
map <Esc>[1;9A <A-k>
map <Esc>[1;9B <A-j>

" Asyncomplete
inoremap <Return> asyncomplete#close_popup()

" fzf.vim
map ff :Files<Return>
map gf :GFiles?<Return>
