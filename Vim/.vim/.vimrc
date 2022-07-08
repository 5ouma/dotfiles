" viminfoの場所
set viminfo+=n~/.vim/.viminfo

" カラースキーム
colorscheme pencil
" Vim再読み込み時に外観モードを反映
function! CAP()
    let output =  system("defaults read -g AppleInterfaceStyle")
    if v:shell_error != 0
        set background=light
    else
        set background=dark
    endif
endfunction


" setting
" 文字コードをUFT-8に設定
set encoding=UTF-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" Beep音オフ
set belloff=all
" 永続的Undo
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif
" OSとクリップボードを共用する
set clipboard+=unnamed
" マウスを使う
set mouse=a


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap <Down> gj
nnoremap <Up> gk
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅(スペースいくつ分)
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" エイリアス
command Cl call ChangetoLight()
command Cd call ChangetoDark()
command Fw FixWhitespace
command Nt NERDTreeToggle
command Ut UndotreeToggle

" キーマップ
nnoremap r <c-r>

" プラグイン
call jetpack#begin()
  Jetpack 'airblade/vim-gitgutter'
  Jetpack 'b4b4r07/vim-shellutils'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'cohama/lexima.vim'
  Jetpack 'mbbill/undotree'
  Jetpack 'phodge/vim-shell-command'
  Jetpack 'preservim/nerdtree'
  Jetpack 'reireias/vim-cheatsheet'
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'thinca/vim-quickrun'
  Jetpack 'tpope/vim-commentary'
  Jetpack 'tpope/vim-fugitive'
  Jetpack 'tpope/vim-surround'
  Jetpack 'vim-scripts/vim-auto-save'
call jetpack#end()
let g:jetpack#optimization=2

" vim-gitgutter
" 起動時に行ハイライトを有効
let g:gitgutter_highlight_lines = 1
" タイピング停止時から反映させるまでの時間
set updatetime=10
" 記号の色を変更
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=red

" vim-shell-command
let g:shell_command_use_col = 0

" NERDTree
" 隠しファイルを表示
let NERDTreeShowHidden = 1

" AutoSave
let g:auto_save = 1
let g:auto_save_silent = 1
