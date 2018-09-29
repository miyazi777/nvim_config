if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/miyajimatakeshi/.config/nvim/init.vim', '/Users/miyajimatakeshi/.config/nvim/dein.toml', '/Users/miyajimatakeshi/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/miyajimatakeshi/.config/nvim'
let g:dein#_runtime_path = '/Users/miyajimatakeshi/.config/nvim/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/miyajimatakeshi/.config/nvim/.cache/init.vim'
let &runtimepath = '/Users/miyajimatakeshi/.config/nvim,/etc/xdg/nvim,/Users/miyajimatakeshi/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/miyajimatakeshi/.config/nvim/repos/github.com/junegunn/fzf,/Users/miyajimatakeshi/.config/nvim/repos/github.com/Shougo/dein.vim,/Users/miyajimatakeshi/.config/nvim/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.2/share/nvim/runtime,/Users/miyajimatakeshi/.config/nvim/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/miyajimatakeshi/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/miyajimatakeshi/.config/nvim/after'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Denite call dein#autoload#_on_cmd('Denite', 'denite.nvim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
  nnoremap <silent> ;j :<C-u>:DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>
  set updatetime=100
  set signcolumn=yes
  let g:previm_open_cmd = 'open -a Safari'
  let g:buftabline_show = 2
  let g:buftabline_numbers = 2
  highlight BufTabLineCurrent ctermbg=black
  highlight BufTabLineActive ctermbg=white
  highlight BufTabLineHidden ctermbg=darkgrey
  highlight BufTabLineFill ctermbg=grey
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_complete_start_length = 3     " 補完を開始する桁数
  let g:deoplete#enable_camel_case = 0
  let g:deoplete#enable_ignore_case = 0
  let g:deoplete#enable_refresh_always = 0
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#file#enable_buffer_path = 1
  let g:deoplete#max_list = 12
  inoremap <expr><tab> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
  let g:fzf_layout = { 'up': '~70%' }
  nnoremap <silent> ;f :FZFFileList<CR>
  command! FZFFileList call fzf#run({ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store ! -name "*~"', 'options': '--exact --reverse', 'sink': 'e'})
  nnoremap <silent> ;g :Grep<CR>
  command! -bang -nargs=* Grep call fzf#vim#grep(   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 0,   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))
  nnoremap <silent> ;s :Find<CR>
  command! -bang -nargs=* Find call fzf#vim#grep(   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1,   <bang>0 ? fzf#vim#with_preview('up:60%')           : fzf#vim#with_preview('right:50%:hidden', '?'),   <bang>0)
  let g:lightline = { 'colorscheme': 'default', 'active': {   'left': [ [ 'mode', 'paste' ],             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] }, 'component_function': {   'filename': 'FilePath',   'gitbranch': 'gitbranch#name' }, }
	function! FilePath()
	  return expand("%:P")
	endfunction
    let g:Gtags_Auto_Map = 0
    let g:Gtags_OpenQuickfixWindow = 1
    nnoremap <silent> ;;l :<C-u>exe("Gtags -f %")<CR>
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete.nvim', 'vim-surround', 'vim-endwise'])
