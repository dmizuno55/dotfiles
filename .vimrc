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

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kchmck/vim-coffee-script'

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
au BufNewFile,BufRead *.js set nowrap tabstop=4 shiftwidth=4 softtabstop=4
au BufNewFile,BufRead *.coffee set nowrap tabstop=2 shiftwidth=2 softtabstop=2
" コピー、カットの内容をクリップボードにも保存する
set clipboard+=unnamed
" 検索設定
set ignorecase
set smartcase
set wrapscan


