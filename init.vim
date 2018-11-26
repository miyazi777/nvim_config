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
autocmd BufNewFile,BufRead *.go nnoremap <C-e> :w<CR> :!go run %<CR>

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
" method jump setting
" ---------------
nnoremap <C-]> g<C-]>

" ---------------
" gtags setting
" ---------------
"nnoremap ;;u :AsyncRun! global -uv<CR>           " gtagsファイルの更新
"nnoremap ;;l :Gtags -f %<CR>            " カレントファイル内の関数一覧
"nnoremap ;;j :GtagsCursor<CR>           " カーソル上の関数の定義場所へジャンプ
"nnoremap ;;r :Gtags -r <C-r><C-w><CR>   " 定義が使われている箇所を一覧表示

" ---------------
" dynamic provider setting
" ---------------
let g:python_host_prog  = '~/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/py3neovim/bin/python'
let g:ruby_host_prog = '~/.rbenv/versions/2.5.1/bin/neovim-ruby-host'

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
Plug 'rhysd/clever-f.vim'
Plug 'glidenote/memolist.vim'
Plug 'itchyny/calendar.vim'
Plug 'simeji/winresizer'
Plug 'vimlab/split-term.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'ludovicchabant/vim-gutentags'
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

" tags
"nnoremap <silent> ;g :Tags<CR>
" <C-]>でタグ検索
"nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>
autocmd filetype ruby nnoremap <silent> ;j :call fzf#vim#tags(expand('<cword>'))<CR>
" fzfからファイルにジャンプできるようにする
let g:fzf_buffers_jump = 1

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

" ---------------
" memolist.vim setting
" ---------------
let g:memolist_path = "~/Dropbox/memo"
let g:memolist_template_dir_path = "~/.config/nvim/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_fzf = 1
nnoremap <silent> ;;m :MemoNew<CR>
nnoremap <silent> ;;l :MemoList<CR>
nnoremap <silent> ;;g :MemoGrep<CR>


" ---------------
" calendar.vim setting
" ---------------
let g:calendar_google_calendar = 1

" ---------------
" winresizer.vim setting
" ---------------
let g:winresizer_gui_enable = 1
let g:winresizer_start_key = 'sr'

" ---------------
" split-term setting
" ---------------
set splitbelow
nnoremap <silent> ;t :25Term<CR>


" ---------------
" vim-lsp setting
" ---------------
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->['solargraph stdio']},
        \ 'whitelist': ['ruby'],
        \ })
endif

if executable('go-langserver')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

let g:lsp_async_completion = 1
autocmd filetype ruby setlocal omnifunc=lsp#complete

autocmd filetype go nnoremap <silent> ;j :LspDefinition<CR>
"nnoremap <C-]> :LspDefinition<CR>


