lang ja_JP
set encoding=utf-8

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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
"}}}
"===============================================================================

"===============================================================================
"=インサートモードに入ったときにステータスラインの色を変える
"{{{
if has('syntax')
   augroup InsertHook
      " 現在のグループに対する「全て」の自動コマンドを削除。
      autocmd!
      autocmd InsertEnter * call s:StatusLine('Enter')
      autocmd InsertLeave * call s:StatusLine('Leave')
   augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
   if a:mode == 'Enter'
      silent! let s:slhlcmd = 'highlight ' . s:GetStatusLineHighlight()
      let cmd = 'hi StatusLine gui=None guifg=Black guibg=Green cterm=None ctermfg=Black ctermbg=Green'
      silent exec cmd
   else
      highlight clear StatusLine
      silent exec s:slhlcmd
   endif
endfunction

function! s:GetStatusLineHighlight()
   redir => hl
   exec 'highlight StatusLine'
   redir END
   let hl = substitute(hl, '[\r\n]', '', 'g')
   let hl = substitute(hl, 'xxx', '', '')
   return hl
endfunction
"}}}

"===============================================================================
" 設定
"{{{
colorscheme murphy
syntax on
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set tabstop=8 softtabstop=3 shiftwidth=3
set noexpandtab
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%l,%c%V%8P
"}}}

"===============================================================================
" Neocomplecache
"{{{
let g:neocomplcache_enable_at_startup = 1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Snippets expand
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" Enable omni completion.
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType vim setlocal omnifunc=complete#CompleteCSS
"}}}

"===============================================================================
" QuickRun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/redcarpet',
      \ 'cmdopt': '--parse-fenced_code_blocks --parse-autolink',
      \ 'outputter': 'browser'
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
