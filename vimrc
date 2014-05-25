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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimfiler.vim'
" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle "osyo-manga/unite-quickfix"

" QuickRun
NeoBundle 'thinca/vim-quickrun'
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle 'tyru/open-browser.vim'

" Make gvim-only colorschemes work transparently in terminal vim 
NeoBundle 'CSApprox'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"
NeoBundle 'tpope/vim-surround'

" CtrlP
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'sgur/ctrlp-extensions.vim'
let g:ctrlp_extensions = ['funky']
" Prefix: s
nnoremap [CtrlP] <Nop>
nmap <C-p> [CtrlP]
nnoremap [CtrlP]p :<C-u>CtrlP<CR>
nnoremap [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap [CtrlP]l :<C-u>CtrlPLine<CR>
nnoremap [CtrlP]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [CtrlP]q :<C-u>CtrlPQuickfix<CR>
nnoremap [CtrlP]s :<C-u>CtrlPMixed<CR>
nnoremap [CtrlP]t :<C-u>CtrlPTag<CR>

let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['menu', 'funky', 'tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'

" Template 
NeoBundle 'mattn/sonictemplate-vim'
" GitGutter
NeoBundle 'airblade/vim-gitgutter'
" Vital!
NeoBundle 'vim-jp/vital.vim'


"runtime! conf.d/*.vim
"runtime! conf.d/ruby.vimrc
runtime conf.d/lightline.vimrc
autocmd BufWinEnter *.rb runtime conf.d/ruby.vimrc




"===============================================================================
" 設定
colorscheme railscasts
syntax on
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set tabstop=4 shiftwidth=4 softtabstop=0
set noexpandtab
set number
set showcmd
if has('persistent_undo')
    set undodir=~/.vim/tmp
    set undofile
endif

nnoremap [vimrc] <Nop>
nmap <Space>, [vimrc]
nnoremap [vimrc]t :<C-u>tabedit $MYVIMRC<CR>
nnoremap [vimrc]s :<C-u>source $MYVIMRC<CR>

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
let g:quickrun_config.ruby = {
      \ 'cmdopt'    : '--test',
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
" VimFiler
" デフォルトに設定
let g:vimfiler_as_default_explorer = 1



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

