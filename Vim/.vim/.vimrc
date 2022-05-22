@REM viminfoの場所
set viminfo+=n~/.vim/.viminfo

@REM カラースキーム
colorscheme pencil
@REM Vim再読み込み時に外観モードを反映
function! CAP()
    let output =  system("defaults read -g AppleInterfaceStyle")
    if v:shell_error != 0
        set background=light
    else
        set background=dark
    endif
endfunction


@REM General
@REM 文字コードをUFT-8に設定
set fenc=utf-8
@REM バックアップファイルを作らない
set nobackup
@REM スワップファイルを作らない
set noswapfile
@REM 編集中のファイルが変更されたら自動で読み直す
set autoread
@REM バッファが編集中でもその他のファイルを開けるように
set hidden
@REM 入力中のコマンドをステータスに表示する
set showcmd
@REM Beep音オフ
set belloff=all


@REM 見た目系
@REM 行番号を表示
set number
@REM 現在の行を強調表示
set cursorline
@REM 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
@REM インデントはスマートインデント
set smartindent
@REM 括弧入力時の対応する括弧を表示
set showmatch
@REM ステータスラインを常に表示
set laststatus=2
@REM コマンドラインの補完
set wildmode=list:longest
@REM 折り返し時に表示行単位での移動できるようにする
nnoremap <Down> gj
nnoremap <Up> gk
@REM シンタックスハイライトの有効化
syntax enable


@REM Tab系
@REM 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
@REM Tab文字を半角スペースにする
set expandtab
@REM 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
@REM 行頭でのTab文字の表示幅
set shiftwidth=2


@REM 検索系
@REM 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
@REM 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
@REM 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
@REM 検索時に最後まで行ったら最初に戻る
set wrapscan
@REM 検索語をハイライト表示
set hlsearch
@REM ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

@REM プラグイン
@REM vim-gitgutter
@REM 起動時に行ハイライトを有効
let g:gitgutter_highlight_lines = 1
@REM タイピング停止時から反映させるまでの時間
set updatetime=10
@REM 記号の色を変更
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=red