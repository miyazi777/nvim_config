" ------------------------------------------
" dein Scripts
" ------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
"set runtimepath+=$HOME/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
"if dein#load_state('$HOME/.config/nvim')
"  call dein#begin('$HOME/.config/nvim')
"  " 起動時に読み込むプラグイン
"  call dein#load_toml('$HOME/.config/nvim/dein.toml', {'lazy':0})
"  " 遅延読み込みするプラグイン
"  call dein#load_toml('$HOME/.config/nvim/dein_lazy.toml', {'lazy':1})
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif

" tes
"  Required:
"filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" ------------------------------------------
" End dein Scripts
" ------------------------------------------

" --------------------------------
" basic setting
" --------------------------------
set encoding=utf-8          " utf-8
set t_Co=256				        " 256色モード
"set termguicolors                   " TrueColor設定

syntax on				            " シンタックスハイライト
set number				            " 行番号表示
set clipboard=unnamed		        " クリップボードを共用できるようにする
set laststatus=2			        " ステータスライン表示
autocmd BufWritePre * :%s/\s\+$//ge	" クリップボードを共用できるようにする
" 日本語切り替えのctrl+Jの無効化
inoremap <C-J> <nop>
" jjコマンドでinsert modeを抜ける
inoremap <silent> jj <ESC>
" 文字列置換をインタラクティブにする
set inccommand=split
" ターミナルモードを抜けるコマンド
tnoremap <silent> jj <C-\><C-n>

" ---------------
" cursor line setting
" ---------------
set cursorline			 	        " カーソル行のハイライト
highlight CursorLine term=underline ctermfg=none ctermbg=none
" 行が折り返し表示されていた場合、行単位でなく表示単位で移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gj

" ---------------
" status line setting
" ---------------
set laststatus=2    " ステータスラインを常に表示
set showmode        " 現在のモードを表示
set showcmd         " コマンド表示
set ruler           " カーソル位置

" ---------------
" search setting
" ---------------
set incsearch       " インクリメンタルサーチ
set hlsearch        " 検索結果をハイライト
hi Search ctermfg=DarkRed ctermbg=lightgrey     " ハイライトカラー
set showmatch       " カッコの対応関係を表示
source $VIMRUNTIME/macros/matchit.vim  " vimの%を拡張する

" ---------------
" command setting
" ---------------
set wildmenu        " コマンドモードの補完
set history=500     " 保存するコマンド履歴数

" インサートモード時に日付入力
inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>

" ---------------
" indent setting
" ---------------
set tabstop=2		    " タブを表示する時の幅
set shiftwidth=2	  " 自動インデントでずれる幅
set softtabstop=0   " 自動インデントで入るタブ数
set autoindent      " 改行時に前の行のインデントを計測
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent         " Cプログラムファイルの自動インデントを始める
set smarttab        " 新しい行を作った時に高度な自動インデントを行う
set expandtab		    " タブをスペースに変換

if has("autocmd")
  filetype plugin indent on " ファイルタイプの検索を有効にする
  filetype indent on        " ファイルタイプに合わせたインデントを開始
  autocmd FileType html     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python   setlocal sw=4 sts=4 ts=4 et
endif

" ---------------
" script setting
" ---------------
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :w<CR> :!ruby %<CR>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :w<CR> :!python3 %<CR>

" ---------------
" terminal setting
" ---------------
set sh=zsh

" ---------------
" buffer setting
" ---------------
set hidden          " バッファが未保存でも他のバッファに移動できるようにする
" ctrl+l 次のバッファ
nnoremap <silent> <C-l> :bnext<CR>
" ctrl+h 前のバッファ
nnoremap <silent> <C-h> :bprev<CR>
" ctrl+q ctrl+qでバッファ削除
nnoremap <silent> <C-q><C-q> :bdelete<CR>
" バッファを閉じる
nnoremap ;q :<C-u>bd<CR>

" ---------------
" window setting
" ---------------
" 縦にウィンドウを分割
nnoremap <silent> ;sp :<C-u>split<CR>
" 横にウィンドウを分割
nnoremap <silent> ;sv :<C-u>vsplit<CR>
nnoremap s <Nop>
nnoremap sp :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" ウィンドウの移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l


" ---------------
" gtags setting
" ---------------
nnoremap ;;u :AsyncRun! global -uv<CR>           " gtagsファイルの更新
"nnoremap ;;l :Gtags -f %<CR>            " カレントファイル内の関数一覧
"nnoremap ;;j :GtagsCursor<CR>           " カーソル上の関数の定義場所へジャンプ
"nnoremap ;;r :Gtags -r <C-r><C-w><CR>   " 定義が使われている箇所を一覧表示

" ---------------
" vim-plug setting
" ---------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'skywind3000/asyncrun.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'deris/vim-shot-f'
Plug 'posva/vim-vue'
call plug#end()

" ---------------
" vim-shot-f.vim setting
" ---------------

" ---------------
" vim-vuftabline.vim setting
" ---------------
let g:buftabline_show = 2
let g:buftabline_numbers = 2

highlight BufTabLineCurrent ctermbg=black
highlight BufTabLineActive ctermbg=white
highlight BufTabLineHidden ctermbg=darkgrey
highlight BufTabLineFill ctermbg=grey

" ---------------
" vim-gitgutter.vim setting
" ---------------
set updatetime=100
set signcolumn=yes

" ---------------
" fzf.vim setting
" ---------------
" layout - down / up / left / right
let g:fzf_layout = { 'up': '~70%' }

" file selector
nnoremap <silent> ;f :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store ! -name "*~"',
            \ 'options': '--exact --reverse',
            \ 'sink': 'e'})

" grep
nnoremap <silent> ;g :Grep<CR>
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))

" under cursor grep
nnoremap <silent> ;s :Find<CR>
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ---------------
" lightline.vim setting
" ---------------
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'FilePath',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

function! FilePath()
  return expand("%:P")
endfunction
