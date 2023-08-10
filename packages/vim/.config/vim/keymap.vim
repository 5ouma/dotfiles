" Move to top and bottom
noremap <Down> gj
noremap <Up> gk

" Redo
noremap r <C-r>

" Search
noremap <silent> <Esc> :nohlsearch<Return>

" New tab
noremap <silent> to :tabedit<Return>
noremap <silent> tq :tabclose<Return>

" Move tab
noremap <silent> t<Left> :tabprevious<Return>
noremap <silent> t<Right> :tabnext<Return>


" Split window
noremap <silent> sh :split<Return>
noremap <silent> sv :vsplit<Return>
noremap sq <C-w>q

" Move window
noremap <Space> <C-w>w
noremap <S-Space> <C-w><S-w>
noremap s<Left> <C-w>h
noremap s<Right> <C-w>l
noremap s<Up> <C-w>k
noremap s<Down> <C-w>j

" Resize window
noremap <C-w><Left> <C-w><
noremap <C-w><Right> <C-w>>
noremap <C-w><Up> <C-w>+
noremap <C-w><Down> <C-w>-

" Move Lines
noremap <Esc>[1;9A <A-k>
noremap <Esc>[1;9B <A-j>

" Asyncomplete
inoremap <Return> asyncomplete#close_popup()

" fzf.vim
noremap <silent> ff :Files<Return>
noremap <silent> gf :GFiles?<Return>
