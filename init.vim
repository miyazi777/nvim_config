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
"set ignorecase                " 検索時に大文字・小文字を区別しない
autocmd BufWritePre * :%s/\s\+$//ge	" クリップボードを共用できるようにする
" 日本語切り替えのctrl+Jの無効化
inoremap <C-J> <nop>
" jjコマンドでinsert modeを抜ける
inoremap <silent> jj <ESC>
" 文字列置換をインタラクティブにする
set inccommand=split
" ターミナルモードを抜けるコマンド
tnoremap <silent> jj <C-\><C-n>

if has('gui_macvim')
  cd ~/Dropbox/memo
end

" ---------------
" macvim setting
" ---------------
if has('gui_macvim')
  set columns=120
  set lines=60
  set termguicolors       " TrueColor設定
  set guifont=Menlo:h14   " font
  set transparency=8      " 透明度を設定
  set guioptions-=T       " No toolbars
  set guioptions-=r       " No scrollbars
  hi Normal ctermbg=Black ctermfg=White guifg=White guibg=Black
  "set background=light    " dark or light
  set background=dark     " dark or light
  "colorscheme solarized
  colorscheme monokai
  "colorscheme antares
end

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
" popup menu setting
" ---------------
" popup menu color
highlight Pmenu ctermfg=Black ctermbg=White
" popup menu select item color
highlight PmenuSel ctermfg=Black ctermbg=gray

" ---------------
" search setting
" ---------------
set incsearch       " インクリメンタルサーチ
set hlsearch        " 検索結果をハイライト
hi Search ctermfg=DarkRed ctermbg=lightgrey     " ハイライトカラー
set showmatch       " カッコの対応関係を表示
source $VIMRUNTIME/macros/matchit.vim  " vimの%を拡張する

" ---------------
" grep setting
" ---------------
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
nnoremap SS :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
" command line mode setting
" ---------------
set wildmenu
set wildmode=list:longest

" ---------------
" terminal setting
" ---------------
set sh=bash

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
" quickfix setting
" ---------------
nnoremap PP :cprevious<CR>
nnoremap NN :cnext<CR>
nnoremap <A-p> :cprevious<CR>
nnoremap <A-n> :cnext<CR>
augroup QuickFixCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

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
let g:python_host_prog  = '/Users/miyajimatakeshi/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/Users/miyajimatakeshi/.pyenv/versions/py3neovim/bin/python'
let g:ruby_host_prog = '/Users/miyajimatakeshi/.rbenv/versions/2.5.1/bin/neovim-ruby-host'

" ---------------
" vim-plug setting
" ---------------
if has('nvim')
  let s:plugin_path = '~/.config/nvim/'
elseif has('gui_macvim')
  let s:plugin_path = '~/.config/nvim/'
endif
if empty(glob(s:plugin_path.'autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(s:plugin_path.'plugged')
Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/.config/nvim/colors/'}
Plug 'sickill/vim-monokai', {'do': 'cp colors/* ~/.config/nvim/colors/'}
Plug 'Haron-Prime/Antares', {'do': 'cp colors/* ~/.config/nvim/colors/'}

Plug 'skywind3000/asyncrun.vim'
" status line
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'deris/vim-shot-f'
Plug 'posva/vim-vue', { 'for': ['vue'] }
Plug 'rhysd/clever-f.vim'
Plug 'glidenote/memolist.vim', { 'on': ['MemoNew', 'MemoList', 'MemoGrep'] }
Plug 'simeji/winresizer'
Plug 'vimlab/split-term.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'LeafCage/yankround.vim'
Plug 'terryma/vim-expand-region'
"Plug 'hackhowtofaq/vim-tionssolargraph'

Plug 'thinca/vim-quickrun'

Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-markdown', { 'for': ['md'] }
Plug 'kannokanno/previm', { 'for': ['md'] }
Plug 'tyru/open-browser.vim', { 'for': ['md'] }

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim', { 'for': ['go'] }
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'

Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }
"Plug 'jodosha/vim-godebug'
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

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

" git file selector
nnoremap <silent> ;gf :GFiles<CR>

" file selector
nnoremap <silent> ;f :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store ! -name "*~" -name "*.*"',
            \ 'options': '--exact --reverse',
            \ 'sink': 'e'})

" grep
nnoremap <silent> ;g :Grep<CR>
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --glob "!tags" --glob "!tags.temp" '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'))

" under cursor grep
nnoremap <silent> ;s :Find<CR>
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --glob "!tags" --glob "!tags.temp" '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" tags
"nnoremap <silent> ;g :Tags<CR>
" <C-]>でタグ検索
"nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>
"autocmd filetype ruby nnoremap <silent> ;j :call fzf#vim#tags(expand('<cword>'))<CR>
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
let g:memolist_filename_prefix_none = 1
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
nnoremap <silent> ;;t :let $VIM_DIR=expand('%:p:h')<CR>:25Term<CR>cd $VIM_DIR<CR>
let g:split_term_default_shell = "bash"

" ---------------
" vim-lsp setting
" ---------------
if executable('solargraph')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

" see https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Go
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

autocmd filetype go nnoremap <silent> ;j :LspDefinition<CR>
autocmd filetype go nnoremap <silent> ;r :LspReferences<CR>
autocmd filetype go nnoremap <silent> ;i :LspHover<CR>
autocmd filetype go nnoremap <C-]> :LspDefinition<CR>

autocmd filetype ruby nnoremap <silent> ;j :LspDefinition<CR>
autocmd filetype ruby nnoremap <silent> ;i :LspHover<CR>
autocmd filetype ruby nnoremap <C-]> :LspDefinition<CR>
"nmap <silent> <Leader>d :LspDefinition<CR>
"nmap <silent> <Leader>p :LspHover<CR>
"nmap <silent> <Leader>r :LspReferences<CR>
"nmap <silent> <Leader>i :LspImplementation<CR>

"let g:lsp_auto_enable = 1
"let g:lsp_signs_enabled = 1         " enable diagnostic signs / we use ALE for now
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"let g:lsp_signs_error = {'text': '✖'}
"let g:lsp_signs_warning = {'text': '~'}
"let g:lsp_signs_hint = {'text': '?'}
"let g:lsp_signs_information = {'text': '!!'}
let g:lsp_async_completion = 1
let g:lsp_signs_error = {'text': '✗'}
" debug
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand("~/.config/nvim/vim-lsp.log")

autocmd FileType ruby setlocal omnifunc=lsp#complete
autocmd FileType go setlocal omnifunc=lsp#complete

" ---------------
" vim-go.vim setting
" ---------------
set autowrite
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"

" debug setting
autocmd FileType go nmap <silent> <M-d> :GoDebugStart<CR>
autocmd FileType go nmap <silent> <M-q> :GoDebugStop<CR>
autocmd FileType go nmap <silent> <M-r> :GoDebugRestart<CR>
autocmd FileType go nmap <silent> <M-c> :GoDebugContinue<CR>
autocmd FileType go nmap <silent> <M-b> :GoDebugBreakpoint<CR>
autocmd FileType go nmap <silent> <M-n> :GoDebugNext<CR>
autocmd FileType go nmap <silent> <M-s> :GoDebugStep<CR>
autocmd FileType go nmap <silent> <M-o> :GoDebugStepOut<CR>

" ---------------
" asynccomplete setting
" ---------------
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1
"if has('gui_macvim')
"  let g:asyncomplete_log_file = expand('~/.vim/asyncomplete.log')
"end
"let g:asyncomplete_log_file = expand('~/.config/nvim/asyncomplete.log')
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"imap <c-space> <Plug>(asyncomplete_force_refresh)
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ---------------
" asyncomplete-file.vim setting
" ---------------
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"    \ 'name': 'file',
"    \ 'whitelist': ['*'],
"    \ 'priority': 10,
"    \ 'completor': function('asyncomplete#sources#file#completor')
"    \ }))

" ---------------
" asyncomplete-buffer.vim setting
" ---------------
"call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"    \ 'name': 'buffer',
"    \ 'whitelist': ['*'],
"    \ 'blacklist': ['go', 'ruby'],
"    \ 'completor': function('asyncomplete#sources#buffer#completor'),
"    \ }))

" ---------------
" asyncomplete-tags.vim setting
" ---------------
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"    \ 'name': 'tags',
"    \ 'whitelist': ['ruby'],
"    \ 'completor': function('asyncomplete#sources#tags#completor'),
"    \ 'config': {
"    \    'max_file_size': 500000000,
"    \  },
"    \ }))

" ---------------
" yankround.vim setting
" ---------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-next)
nmap <C-n> <Plug>(yankround-prev)
"" 履歴取得数
let g:yankround_max_history = 50


" ---------------
" previm.vim setting
" ---------------
""" markdown {{{
   autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
   autocmd BufRead,BufNewFile *.md  set filetype=markdown
   " Need: kannokanno/previm
   nnoremap <silent> ;;p :PrevimOpen<CR> " ;;pでプレビュー
   " 自動で折りたたまないようにする
   let g:vim_markdown_folding_disabled=1
   let g:previm_enable_realtime = 1
 " }}}

" ---------------
" vim-expand-region.vim setting
" ---------------
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ---------------
" scripts
" ---------------
" ---------------
" rename file script
" ---------------
function! RenameFile(...)
  let old_name = expand('%')

  if a:0 >= 1
    let default_name = expand("%:h") . '/' . a:1
  else
    let default_name = expand('%')
  endif
  let new_name = input('New current file name: ', default_name)
  if filereadable(new_name)
    redraw!
    echo "Can't rename : Already exists new filename."
    return
  end

  if new_name != '' && new_name != old_name
    exec ':f ' . new_name . '|call delete(expand("#"))'
    exec ':saveas ' . new_name
    redraw!
  endif
endfunction
command! -nargs=? Rename call RenameFile(<f-args>)

" ---------------
" delete file script
" ---------------
function! DeleteFile()
  let old_name = expand('%')
  let answer = confirm("Delete current file?", "&Y Yes\n&N No\n")
  if old_name != '' && answer == 1
    exec 'call delete(expand("%"))|:bw'
    redraw!
    echo 'Deleted file : ' . old_name
  endif
endfunction
command! Delete call DeleteFile()
