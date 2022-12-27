" Move to top and bottom
nnoremap <Down> gj
nnoremap <Up> gk

" Redo
nmap r <C-r>

" Search
nmap <Esc> :nohlsearch<Return><Esc>

" New tab
nmap <silent> to :tabedit<Return>
nmap <silent> tq :tabclose<Return>

" Move tab
nmap <silent> t<left> :tabprevious<Return>
nmap <silent> t<right> :tabnext<Return>


" Split window
nmap <silent> sh :split<Return>
nmap <silent> sv :vsplit<Return>
nmap sq <C-w>q

" Move window
nmap <Space> <C-w>w
nmap <S-Space> <C-w><S-w>
nmap s<left> <C-w>h
nmap s<right> <C-w>l
nmap s<up> <C-w>k
nmap s<down> <C-w>j

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><left> <C-w>-
