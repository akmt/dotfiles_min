" === 見た目変更 ===
" 構文ごとの色分け
syntax on
" 行番号付加
set nu
" vi互換モードなし
set nocompatible

" カラースキーム設定
" colorscheme hybrid
" colorscheme torte
" colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark

" メッセージ表示を2行確保
set cmdheight=2

" コメント行の色変更
hi Comment ctermfg=5 cterm=NONE

" 開いているファイルをそのまま実行
nnoremap <silent> <C-p> :<C-u>execute '!' &l:filetype '%'<Return>

" NeoBundle設定
" 以下は必要に応じて追加
" vim7.3以降必須
" mkdir -p ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc

"" 容量に余裕ありそうな環境用
"" 以下を入れると約35MB
"if has('vim_starting')
"     set runtimepath+=~/.vim/bundle/neobundle.vim
"     call neobundle#begin(expand('~/.vim/bundle/'))
"          NeoBundleFetch 'Shougo/neobundle.vim'
"          
"          NeoBundle 'Shougo/unite.vim'
"          NeoBundle 'Shougo/neosnippet.vim'
"          NeoBundle 'alpaca-tc/alpaca_powertabline'
"          NeoBundle 'https://github.com/Lokaltog/powerline.git'
"          NeoBundle 'itchyny/lightline.vim'
"          NeoBundle 'itchyny/landscape.vim'
"          NeoBundle 'Shougo/neocomplcache'
"          NeoBundle 'petdance/vim-perl'
"          NeoBundle 'hotchpotch/perldoc-vim'
"          NeoBundle 'Align'
"
"          NeoBundleCheck
"
"     call neobundle#end()
"endif


" for lightline.vim --------------------
"let g:lightline = {
"      \ 'colorscheme': 'jellybeans',
"      \ 'component': {
"      \   'readonly': '%{&readonly?"\ue0a2":""}',
"      \ },
"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"      \ }


" === 操作系 ===
" indent : 行頭の空白削除を許可
" eol    : 改行の削除を許可
" start  : 挿入モード開始位置での削除を許可
set backspace=indent,eol,start
" カーソル位置を表示する
set ruler
" コマンドモード時に入力中のコマンドを表示
set showcmd
" 閉じ括弧入力時、対応する開き括弧に一瞬ジャンプ
set showmatch
" 検索パターンが大文字を含んでいたらignorecaseで上書きする
set smartcase
" 検索がファイル末尾まで進んだら先頭に戻って再検索
set wrapscan
" 新しい行を開始したとき、現在行とインデントを揃える
set autoindent
" ペーストモードの切り替えをF4に設定
set pastetoggle=<F4>
" beep音の消去
set noerrorbells
set vb t_vb=
" コマンドラインモードでTabによるファイル名補完を有効に
set wildmenu
" コマンドラインモードでファイル名補完
" longest : 共通部分まで補完 
" list    : リスト表示
" full    : 全検索
" カンマ区切りでTabの回数毎に指定
set wildmode=longest,list,full
" コマンドモードの履歴保存数
set history=200
" ウィンドウより長い行は折り返して表示
set wrap
" 単語の途中で改行しない
set linebreak
" 入力中テキストの最大幅設定。超えると改行。0で無効化
set textwidth=0
" 折り返しを開始する右側からの文字数
set wrapmargin=0

" 自動改行の抑制
autocmd FileType * setlocal formatoptions-=ro
" ステータスバー
set laststatus=2
set statusline=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%Y][lines=%L]%=%l,%c%V%8P

" ファイルタイプ毎の設定を有効に
filetype on
filetype indent on
filetype plugin on

" tab関連
set tabstop=4              " タブの表示幅
set shiftwidth=4           " インデント時のスペース数
set expandtab              " タブを空白に置き換え
set softtabstop=0          " 0でなければタブ入力時に数値分のスペース 
set list                   " タブ文字をCTRL-Iで表示、行末に＄で表示、を無効化
set listchars=tab:>-       " listが有効な場合、tab文字を可視化

" KeyMap USキーボード用
noremap ; :
noremap : ;
" JPキーボード用
" nmap ; :
" cmap ; :
nnoremap j gj
nnoremap k gk
nnoremap e <C-a>
nnoremap E :Sexplore<cr>
nnoremap L :call Logging()<cr>
nnoremap <C-c><C-c> :<C-u>nohlsearch<cr><Esc>
set scrolloff=9999


"文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=utf8
  set fileencoding=utf8
endif

"related search
set hlsearch
set ignorecase
set smartcase
set incsearch

" perl mapping
map <F1> O#!/usr/bin/env perl<CR><ESC>iuse strict;<CR><ESC>iuse warnings;<CR>
vmap ,; :s/^/#/<CR>:noh<CR>
vmap ,cl :s/^#//<CR>:noh<CR>
imap ,dumper  use Data::Dumper; warn Dumper(  );<ESC>F;a<Return><ESC>f(la


"script
au BufWritePost * if &ft == "" | filetype detect | endif
autocmd FileType perl :map <down> <esc>:!/usr/bin/env perl    %<cr>
autocmd BufNewFile *.pm 0r $HOME/.vim/template/pm.txt
autocmd BufNewFile *.pl 0r $HOME/.vim/template/pl.txt
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt




