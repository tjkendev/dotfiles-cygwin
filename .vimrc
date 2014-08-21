" .vimrc for cygwin
scriptencoding utf-8

""" Editor """
set clipboard=unnamed,autoselect " クリップボード利用
set smarttab
set tabstop=2    " タブ幅
set shiftwidth=2 " タブを挿入するときの幅
set expandtab    " タブをスペースとして扱う
set softtabstop=0 " 
set shiftround   " インデントはshiftwidthに合わせる
set matchpairs& matchpairs+=<:>
set infercase    " 補完時の大文字小文字区別しない
"set virtualedit=all    " 文字が存在しないところにもカーソル移動可能
set hidden       " バッファを閉じる代わりに隠す
set backspace=indent,eol,start " Backspaceによる削除有効化
set autoindent   " オートインデント
"set cindent     " オートインデントより賢いインデント(C)
set nowrap       " 長いテキストを折り返さない
set formatoptions-=r    " 改行時コメント無効
set formatoptions-=o
set fileformats=unix,dos,mac " 改行コードの自動認識

""" Visual """
set ruler       " ルーラー表示
set number      " 行番号
set list        " 不可視文字の可視化
set cursorline  " カーソルのある行を強調(7.4~)
"set cursorcolumn " カーソルのある列を強調
set laststatus=2 " ステータスラインを常に表示
set t_Co=256
set showmatch   " 対応するカッコをハイライト表示
set matchtime=3 " 対応括弧のハイライト表示を3秒に
" set title       " > Vim を使ってくれてありがとう < じゃあないんだよ
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
"set showcmd     " 入力中のコマンドをステータスに表示

""" Detail """
" 不可視文字の設定
set listchars=tab:▸\ ,eol:\ ,trail:-,extends:»,precedes:«,nbsp:%

""" Command """
" ESC二回で検索ハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" ファイルのフルパスを表示
ca fp echo<Space>expand("%:p")
" ファイルの差分を取る
ca vd vertical<Space>diffsplit
" .vimrcの再読み込み
ca svimrc source<Space>~/.vimrc

""" NeoBundle """
set nocompatible               " Be iMproved
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" base
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outlie'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'VimClojure'
NeoBundle 'indentLine'
NeoBundle 'tpope/vim-surround'
" git
NeoBundle 'tpope/vim-fugitive'
" python
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'vim-autopep8'
" ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
" c++
NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'autoload' : {'filetypes' : 'cpp'}
      \ }
NeoBundleLazy 'osyo-manga/vim-stargate', {
      \ 'autoload' : {'filetypes' : 'cpp'}
      \ }
"NeoBundleLazy 'osyo-manga/vim-marching', {
"      \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
"      \ 'autoload' : {'filetypes' : ['c', 'cpp']}
"      \ }
"NeoBundleLazy 'Rip-Rip/clang_complete', {
"      \ 'autoload' : {'filetypes' : ['c', 'cpp']}
"      \ }
" C#
"NeoBundleLazy 'nosami/Omnisharp', {
"\   'autoload': {'filetypes': ['cs']},
"\   'build': {
"\     'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
"\     'mac': 'xbuild server/OmniSharp.sln',
"\     'unix': 'xbuild server/OmniSharp.sln',
"\   }
"\ }
" javascript
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
" html
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'tyru/open-browser.vim'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'AtsushiM/search-parent.vim'
"NeoBundle 'AtsushiM/sass-compile.vim'
NeoBundle 'othree/html5.vim'
" css
NeoBundle 'skammer/vim-css-color'
NeoBundle 'lilydjwg/colorizer'
" R
"NeoBundle 'vim-scripts/Vim-R-plugin', {
"      \ 'autoload' : {'filetypes' : 'r'}
"      \ }
" colorscheme
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on " Required!

" git protocol
let g:neobundle_default_git_protocol='git'

" C++ path
augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/i686-pc-mingw32/sys-root/mingw/include,/lib/gcc/i686-pc-cygwin/4.8.3/include/c++/,,
augroup END

" java highlight setting
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1

" lisp

" scheme
" (insert) indent
autocmd FileType scheme inoremap <buffer> <Tab> <C-o>==
" iskeyword
autocmd FileType scheme setlocal iskeyword=@,33,35-38,42-43,45-58,60-64,94,_,126

" python
" タブ幅4に変更(pep8)
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4


"""" Unite.vim """"
ca uf Unite file
ca ufb Unite file buffer
ca ub Unite buffer

"""" easymotion """"
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" leaderkey = ";"
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
" javaはパッケージのルートから編集する
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
            \     "exec" : [
            \         "javac -J-Dfile.encoding=UTF8 %o %{expand('%')}",
            \         "%c -Dfile.encoding=UTF8 %{expand('%:r')} %a"
            \     ],
            \ },
            \ "html" : {
            \     "command" : "cygstart",
            \     "exec" : "%c %s",
            \     "hook/time/enable" : 0,
            \     "outputter/buffer/close_on_empty" : 1
            \ }
            \}
" <C-c>でquickrun強制終了
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
" program F5 run
nnoremap <silent><F5> :QuickRun -mode n<CR>
vnoremap <silent><F5> :QuickRun -mode v<CR>
" :qr で :QuickRun と入力できるように
ca qr QuickRun

""" neocomplete """

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_debug = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""" jedi-vim """
"autocmd FileType python setlocal omnifunc=jedi#completions
""let g:jedi#popup_select_first = 0
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
""let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:neocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"
""" vim-marching """
"let g:marching_include_paths = filter(
"      \ split(glob('/usr/include/*'), '\n') +
"      \ split(glob('/usr/local/include/*'), '\n') +
"      \ split(glob('/usr/i686-pc-mingw32/sys-root/mingw/include/*'), '\n') +
"      \ split(glob('/lib/gcc/i686-pc-cygwin/*/include/c++/*'), '\n'),
"      \ 'isdirectory(v:val)')
"let g:marching_clang_command_options = {
"      \ 'cpp' : '-std=gnu++1y'
"      \ }
"let g:marching_enable_neocomplete = 1
"let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:marching_backend = "sync_clang_command"
"let g:marching_debug = 1

""" clang_complete """
"let g:clang_periodic_quickfix = 1
"let g:clang_complete_copen = 1
"let g:clang_use_library = 1
"
"let g:clang_user_options = '-std=c++11 -stdlib=libc++'

""" syntastic """
" java compiler encoding => utf-8
let g:syntastic_java_javac_executable="javac -encoding UTF-8"
" use c++11
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
" use pyflakes and pep8
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" pep8のErrorCheckは僕には厳しいので少し緩めに
let g:syntastic_python_pep8_args='--ignore=E302,E501,E225,E226,E228,E265,E702,E703'
" SyntasticToggleMode を F4 で切り替え
noremap <silent><F4> :SyntasticToggleMode<CR>

""" autopep8 """
let g:autopep8_ignore='E302,E501,E225,E226,E228,E265,E702,E703'

""" emmet """
let g:user_emmet_settings = {
      \ 'lang' : 'ja'
      \ }

""" after command """
set showcmd

""" colorscheme """
colorscheme jellybeans
highlight Comment ctermfg=70
