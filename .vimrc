" .vimrc for cygwin (+ MaxOSX)
scriptencoding utf-8

""" Editor """
set clipboard=unnamed,autoselect " クリップボード利用
set smarttab
set tabstop=4    " タブ幅
set shiftwidth=4 " タブを挿入するときの幅
set expandtab    " タブをスペースとして扱う
set softtabstop=0 " 
set shiftround   " <>インデントはshiftwidth
set matchpairs& matchpairs+=<:>
set infercase    " 補完時の大文字小文字区別しない
"set virtualedit=all    " 文字が存在しないところにもカーソル移動可能
set hidden       " バッファを閉じる代わりに隠す
set backspace=indent,eol,start " Backspaceによる削除有効化
set autoindent   " オートインデント
"set cindent     " オートインデントより賢いインデント(C用?)
set nowrap       " 長いテキストを折り返さない
set formatoptions-=r    " 改行時コメント無効
set formatoptions-=o
set fileformats=unix,dos,mac " 改行コードの自動認識

""" Visual """
set ruler       " ルーラー表示
set nu          " 行番号
set list        " 不可視文字の可視化
set cursorline  " カーソルのある行を強調(7.4~)
"set cursorcolumn " カーソルのある列を強調
set laststatus=2 " ステータスラインを常に表示
set t_Co=256
set showmatch   " 対応するカッコをハイライト表示
set matchtime=3 " 対応括弧のハイライト表示を3秒に
" set title       " > Vim を使ってくれてありがとう <
set notitle     " タイトル変更しない
syntax on       " syntax on

""" Search """
set ignorecase  " 検索時大文字小文字区別しない
set smartcase   " 大文字が含まれている場合は区別して検索
set hlsearch    " 検索結果文字列のハイライト有効
set incsearch   " インクリメントサーチ
set wrapscan    " 最後まで検索したら先頭に

""" encoding """
set encoding=utf-8
set ambw=double
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

""" System """
set mouse=a     " マウス機能有効化
set nobackup    " バックアップ不要
set backupdir=~/.vimbackup " バックアップディレクトリ
set noswapfile  " スワップファイル不要
set vb t_vb=    " ビープ音Off
set shortmess& shortmess+=I     " 起動時のメッセージを消す
set noimdisable " IMを使う
set iminsert=0  " 入力モードで自動的に日本語を使わない
set imsearch=0  " 検索で自動的に日本語を使わない
set autoread    " ファイルが変更された時自動で読みなおす

""" CommandLine """
set wildmenu    " コマンドラインモードでTabキーでファイル名保管を有効
set showcmd     " 入力中のコマンドをステータスに表示

""" Detail """
" 不可視文字の設定
set listchars=tab:▸\ ,eol:\ ,trail:-,extends:»,precedes:«,nbsp:%

""" Command """
" ESC二回で検索ハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" ファイルのフルパスを表示
command! Fp :echo expand("%:p")

""" NeoBundle """
set nocompatible               " Be iMproved
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" base
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'VimClojure'
NeoBundle 'indentLine'
NeoBundle 'tpope/vim-surround'
" git
NeoBundle 'tpope/vim-fugitive'
" ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
" c++
NeoBundle 'vim-jp/cpp-vim'
" javascript
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
" html
NeoBundle 'mattn/emmet-vim'
" NeoBundle 'tyru/open-browser.vim'
NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'AtsushiM/search-parent.vim'
" NeoBundle 'AtsushiM/sass-compile.vim'
NeoBundle 'othree/html5.vim'
" css
" NeoBundle 'skammer/vim-css-color'
" colorscheme系
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on " Required!

" git protocol
let g:neobundle_default_git_protocol='git'

" java highlight setting
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1

"""" easymotion """"
map <Leader> <Plug>(easymotion-prefix)
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

""" lightline """
set guifont=Inconsolata_for_Powerline:h10
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }

""" quickrun """
let g:quickrun_config = {
            \ "_" : {
            \     "runner" : "vimproc",
            \     "runner/vimproc/updatetime" : 60,
            \     "hook/time/enable" : 1
            \ },
            \ "cpp/g++" : {
            \     "type"    : "cpp",
            \     "command" : "g++",
            \     "cmdopt"  : "-std=c++11 -stdlib=libc++"
            \ },
            \ "java" : {
            \     "exec" : ['javac -J-Dfile.encoding=UTF8 %o %s', '%c -Dfile.encoding=UTF8 %s:t:r %a'],
            \     "convert_win_path": 1,
            \ }
            \}
" :QuickRun打つのだるいしF5
nnoremap <silent><F5> :QuickRun -mode n<CR>
vnoremap <silent><F5> :QuickRun -mode v<CR>
" :qr で :QuickRun と入力できるように
ca qr QuickRun

""" syntastic """
" java compiler encoding => utf-8
let g:syntastic_java_javac_executable="javac -encoding UTF-8"
" use c++11
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
" use pyflakes and pep8
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" pep8のErrorCheck僕には厳しいので少し緩めに
let g:syntastic_python_pep8_args='--ignore=E302,E501,E225,E226,E228,E265,E702,E703'
" SyntasticToggleMode を F4 で切り替え
nnoremap <silent><F4> :SyntasticToggleMode<CR>
vnoremap <silent><F4> :SyntasticToggleMode<CR>

""" colorscheme """
colorscheme jellybeans
highlight Comment ctermfg=70
