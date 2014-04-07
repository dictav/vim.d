lang ja_JP
set encoding=utf-8
set shell=/bin/bash

"===============================================================================
" NeoBundle
"{{{
set nocompatible							 " Be iMproved
filetype off									 " Required!

if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	 \'build' : {
	 \   'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
	 \  'cygwin' : 'make -f make_cygwin.mak',
	 \  'mac' : 'make -f make_mac.mak',
	 \  'unix' : 'make -f make_unix.mak',
	 \},
	 \}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'noahlh/html5.vim'
NeoBundle 'CSApprox'
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
" ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
" other
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
NeoBundle 'dgryski/vim-godef'
NeoBundle 'kannokanno/previm'
NeoBundle 'vim-jp/vital.vim'

" jekyll
NeoBundle 'csexton/jekyll.vim'
let g:jekyll_path = "~/Works/dictav.github.com/"
"}}}
"===============================================================================

"===============================================================================
" lightline
"{{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
"}}}

"===============================================================================
" 設定
"{{{
colorscheme railscasts
syntax on
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set tabstop=4 shiftwidth=4 softtabstop=0
set noexpandtab
set number
if has('persistent_undo')
    set undodir=~/.vim/tmp
    set undofile
endif


"}}}

"===============================================================================
" Neocomplete
"{{{
let g:neocomplete#enable_at_startup = 1
" Define keyword.
let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#omni_patterns = {}

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Snippets expand
imap <expr><C-k> neocomplete#sources#snippets_complete#expandable() ? "\<Plug>(neocomplete#snippets_expand)" : "\<C-o>D"
smap <C-k> <Plug>(neocomplete#snippets_expand)

" Enable omni completion.
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType vim setlocal omnifunc=complete#CompleteCSS

let g:neocomplete#dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'coffee' : $HOME.'/.vim/dict/javascript.dict'
    \ }
"}}}

"===============================================================================
" QuickRun
let g:quickrun_config = {}
let g:quickrun_config._ = {
	 \'runner' : 'vimproc',
	 \'runner/vimproc/updatetime' : 10,
	 \'outputter/buffer/split': ':botright'
	 \}
"===============================================================================
" Markdown
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

"===============================================================================
" NeoSnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
   set conceallevel=2 concealcursor=i
endif

"===============================================================================
" RSpec

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config['ruby.rspec'] = {
	 \ 'command': 'rspec',
	 \ 'cmdopt': '-fs --color -I.',
	 \ 'outputter/buffer/filetype': 'rspec-result'
	 \}

"===============================================================================
" CoffeeScript
" インデントを設定
autocmd FileType coffee     setlocal ts=2 sw=2 et

"===============================================================================
" VimFiler
" デフォルトに設定
let g:vimfiler_as_default_explorer = 1

"===============================================================================
" Go
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menu,preview
let g:neocomplete#omni_patterns.go = '\h\w*\.\?'
auto BufWritePre *.go Fmt


"===============================================================================
" CtrlP
let g:ctrlp_use_migemo = 1

"===============================================================================
" GitGutter
let g:gitgutter_enabled = 1
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


"===============================================================================
" Objective-C 
let g:quickrun_config['objc'] = {
\   'command': 'clang',
\	'cmdopt': '-framework Foundation',
\   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\   'tempfile': '%{tempname()}.m',
\   'hook/sweep/files': '%S:p:r',
\ }

"===============================================================================
" submode 
NeoBundle "kana/vim-submode"
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

"===============================================================================
" TwilioCall
NeoBundle 'twiliocall-vim', {
			\ "type" : "nosync",
			\}

let g:twiliocall_from = '+17402744226'
let g:twiliocall_sid = 'AC996ac19dd791add3ff7437c62bbe0fc3'
let g:twiliocall_auth_token = 'a4613c5c26cfa9803eceb13fa127d1c8'

