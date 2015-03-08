" vi互換モードOFF
set nocompatible
" ファイルエンコーディング
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

" NeoBundle設定
if has('vim_starting')
	set rtp+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc()

NeoBundleFetch 'Shougo/neobundle.vim'

" Unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" syntax hightlight
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/nerdtree'

NeoBundleCheck

filetype plugin indent on
syntax on

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_javascript_checkers=[
	\ 'jshint',
	\ 'jscs',
\ ]
let g:syntastic_html_tidy_ignore_errors=[' proprietary attribute "ng-']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']

" backspaceの設定
set backspace=start,eol,indent
" コマンドラインモード補完設定
set wildmenu wildmode=list:full
" 行数を表示する
set number
" ファイル名を表示する
set title
" 括弧入力時の対応する括弧を表示する
set showmatch
" コードの色分け
set nohlsearch
set cursorline
colorscheme hybrid
" インデント設定
set autoindent
set expandtab
au BufNewFile,BufRead *.js set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.coffee set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.ino set nowrap tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.html set nowrap tabstop=2 shiftwidth=2 softtabstop=2

" コピー、カットの内容をクリップボードにも保存する
set clipboard+=unnamed

" 検索設定
set ignorecase
set smartcase
set wrapscan


