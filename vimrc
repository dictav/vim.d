lang ja_JP
let &t_Co=256
set shell=/bin/bash
set encoding=utf-8

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

Plug 'Shougo/vimproc.vim'

" Look & Feel
"==============================
" Make gvim-only colorschemes work transparently in terminal vim 
Plug 'CSApprox'
" indentの深さに色を付ける
Plug 'nathanaelkane/vim-indent-guides' ", { 'on':  [''] }
Plug 'itchyny/lightline.vim'


" IDE
"==============================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'mattn/sonictemplate-vim'
Plug 'justinmk/vim-dirvish' " Filer
Plug 'tyru/open-browser.vim'
let g:openbrowser_browser_commands=[{'name': 'open', 'args': ['{browser}', '-g', '{uri}']}]

Plug 'cohama/vim-hier'
Plug 'dannyob/quickfixstatus'
Plug 'rking/ag.vim'
"nmap ' :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<cr>

" QuickRun
"==============================
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
      \	"_" : {
      \   "outputter/buffer/split" : ":botright 8sp",
      \   "outputter" : "multi:buffer:quickfix",
      \   "outputter/buffer/running_mark" : "running...",
      \   "outputter/quickfix/open_cmd" : "",
      \   "runner" : "vimproc",
      \   "runner/vimproc/updatetime" : 500,
      \   "runner/vimproc/sleep" : 10,
      \   "hook/inu/enable" : 0,
      \   "hook/sweep/enable" : 0,
      \   "hook/clear_quickfix/enable_hook_loaded" : 1,
      \   "hook/clear_bufixlist/enable_hook_loaded" : 1,
      \   "hook/clear_location_list/enable_hook_loaded" : 1,
      \   "hook/hier_update/enable_exit" : 1,
      \   "hook/quickfix_status_enable/enable_exit" : 1,
      \   "hook/quickfix_replate_tempname_to_bufnr/enable_exit" : 1,
      \   "hook/quickfix_replate_tempname_to_bufnr/priority_exit" : -10,
      \   "hook/extend_config/enable": 1,
      \   "hook/extend_config/force": 1,
      \   "hook/echo/enable" : 1,
      \   "hook/echo/enable_output_exit" : 1,
      \   "hook/echo/priority_exit" : 10000,
      \   "hook/echo/output_success" : "😊",
      \   "hook/echo/output_failure" : "😭",
      \	},
      \}


" Git
"==============================
Plug 'lambdalisue/vim-gista'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


" CtrlP
"==============================
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'kaneshin/ctrlp-sonictemplate'
Plug 'zeero/vim-ctrlp-gista'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_use_migemo = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v www']
" let g:ctrlp_user_command = 'files -p %s'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['menu', 'funky',  'tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
" Key mapping
nnoremap [CtrlP] <Nop>
nmap <C-p> [CtrlP]
nnoremap [CtrlP]<C-p> :<C-u>CtrlP<CR>
nnoremap [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap [CtrlP]l :<C-u>CtrlPLine<CR>
nnoremap [CtrlP]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [CtrlP]q :<C-u>CtrlPQuickfix<CR>
nnoremap [CtrlP]s :<C-u>CtrlPMixed<CR>
nnoremap [CtrlP]t :<C-u>CtrlPTag<CR>
nnoremap [CtrlP]g :<C-u>CtrlPGista<CR>

" Submode
"==============================
Plug 'kana/vim-submode'

" Neocomplete
"==============================
Plug 'Shougo/neocomplete'
let g:neocomplete#sources#omni#input_patterns = {}
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"" Define keyword.
let g:neocomplete#keyword_patterns = {'default': '\h\w*'}

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Markdown
"==============================
Plug 'godlygeek/tabular'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'rcmdnk/vim-markdown'

let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1
augroup Markdown
  autocmd!
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

" Ruby
"==============================

Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby.rspec'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
augroup RUBY
  autocmd!
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:quickrun_config["ruby/watchdogs_checker" ] = {
            \ "type" : "watchdogs_checker/rubocop"
            \}

let g:quickrun_config["ruby.rspec/watchdogs_checker" ] = {
            \ "type" : "watchdogs_checker/rubocop"
            \}

" OCaml
"==============================
"Plug 'cohama/the-ocamlspot.vim', { 'for', ['ocaml'] }
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"Plug 'def-lkb/ocp-indent-vim'

" Haxe
"==============================
Plug 'jdonaldson/vaxe', { 'for': ['haxe', 'hxml', 'nmml.xml']}
let g:vaxe_haxe_version = 3

" vaxeの動作にはautowriteを有効にする必要がある
augroup MyAutoCmd
  autocmd!
  autocmd FileType haxe,hxml,nmml.xml setlocal autowrite
  autocmd FileType haxe,hxml,nmml.xml call s:init_vaxe_keymap()
augroup END

function! s:init_vaxe_keymap()
  " .hxmlファイルを開いてくれるやつ
  nnoremap <buffer> ,vo :<C-u>call vaxe#OpenHxml()<CR>
  " タグファイル作ってくれるやつ(別途、.ctagsの定義をしませう)
  nnoremap <buffer> ,vc :<C-u>call vaxe#Ctags()<CR>
  " 自動インポートな
  nnoremap <buffer> ,vi :<C-u>call vaxe#ImportClass()<CR>
endfunction


"" add autocompletion for haxe
let g:neocomplete#sources#omni#input_patterns.haxe = '\v([\]''"\)]|\w|(^\s*))(\.|\()'

" JavaScript
"==============================
Plug 'moll/vim-node', { 'for': ['javascript', 'coffee'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'coffee'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'coffee'] }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
augroup JavaScript
  autocmd!
  autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

" CSS
"==============================
Plug 'skammer/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
augroup Markdown
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END

" Go
"==============================
Plug 'fatih/vim-go', { 'for': ['go'] }

" Vim
"==============================
Plug 'vim-jp/vital.vim', { 'for': ['vim'] }

" WatchDogs
"==============================
Plug 'osyo-manga/shabadou.vim' 
Plug 'osyo-manga/vim-watchdogs'
function! s:init_watch_dogs()
  " quickfix を閉じる
  let g:quickrun_config["watchdogs_checker/_"] = {
        \       "hook/close_quickfix/enable_exit" : 1,
        \}


  " 書き込み後にシンタックスチェックを行う
  let g:watchdogs_check_BufWritePost_enable = 1

  " バッファに書き込み後、1度だけ行われる
  let g:watchdogs_check_CursorHold_enable = 1

  " watchdogs.vim の設定を追加
  call watchdogs#setup(g:quickrun_config)
endfunction

call plug#end()

call s:init_watch_dogs()

" submode
"==============================
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')


" VIMRC Key
"==============================
nnoremap [vimrc] <Nop>
nmap <Space>. [vimrc]
nnoremap [vimrc]e :<C-u>edit $MYVIMRC<CR>
nnoremap [vimrc]t :<C-u>tabedit $MYVIMRC<CR>
nnoremap [vimrc]s :<C-u>source $MYVIMRC<CR>
nnoremap [vimrc]cd :<C-u>cd ~/.vim<CR>

" make後の結果をquickfixへ出力させる
autocmd QuickfixCmdPost make copen
autocmd QuickfixCmdPost make call <SID>auto_ccl()

function! s:auto_ccl()
  if &ft != 'qf'
    return
  endif

  " リストが空ならそのまま閉じる
  if getqflist() == []
    :QuickfixStatusDisable
    :cclose
  else
    :QuickfixStatusEnable
  endif
  :HierUpdate
endfunction


"===============================================================================
" 設定
colorscheme railscasts
syntax on
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set number
set showcmd
if has('persistent_undo')
	set undodir=~/.vim/tmp
	set undofile
endif
set laststatus=2
