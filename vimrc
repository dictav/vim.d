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
NeoBundle 'othree/html5.vim'
NeoBundle 'noahlh/html5.vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'CSApprox'
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
if has('persistent_undo')
    set undodir=~/.vim/tmp
    set undofile
endif


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
let g:quickrun_config._ = {
	 \'runner' : 'vimproc',
	 \'runner/vimproc/sleep' : 100,
	 \'runner/vimproc/updatetime' : 0
	 \}
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

"===============================================================================
" eregex
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"===============================================================================
" RSpec

function! RSpecSyntax()
   syn keyword rubyRSpecMethod describe context it its specify shared_examples_for it_should_behave_like before after around subject fixtures controller_name helper_name
   syn match rubyRSpecMethod '\<let\>!\='
   syn keyword rubyRSpecMethod violated pending expect double mock mock_model stub_model
   syn match rubyRSpecMethod '\.\@<!\<stub\>!\@!'
   hi def link rubyRSpecMethod             Function
endfunction

augroup RSpec
   autocmd!
   autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec
   autocmd BufReadPost *_spec.rb call RSpecSyntax()
augroup END



let g:quickrun_config['ruby.rspec'] = {
	 \ 'command': 'rspec',
	 \ 'cmdopt': '-fs --color -I.',
	 \ 'outputter/buffer/filetype': 'rspec-result'
	 \}


"===============================================================================
" Tumblr
"let s:tumblr_app_host = "http://localhost:5000/"
let s:tumblr_app_host = "http://tumblr-app.herokuapp.com/"
let s:tumblr_app_token = "QELkJjkgUsDLMaHJh4DR16uC3kCEUHK2RXhNFv4I6GcU5GVAtb"
let s:tumblr_app_blog = "diclog"
let s:tumblr_app_html_format = ""
	 \.'<!DOCTYPE HTML>'
	 \.'<html lang="en">'
	 \.'<head>'
	 \.'   <meta charset="UTF-8">'
	 \.'   <title>PUT TEST</title>'
	 \.'   <script type="text/javascript">'
	 \.'      window.onload = function () {'
	 \.'	 form = document.getElementById("form");'
	 \.'	 form.submit();'
	 \.'      }'
	 \.'   </script>'
	 \.'</head>'
	 \.'<body>'
	 \.'   <form id="form" action="__ACTION__" method="post">'
	 \.'      <input type="hidden" name="title" value="__TITLE__">'
	 \.'      <input type="hidden" name="body" value="__BODY__">'
	 \.'   </form>'
	 \.'</body>'
	 \.'</html>'

function! TumblrAuth()
   call openbrowser#open(s:tumblr_app_host)
endfunction

function! TumblrRequestPost(action, title, body)
   let action = [s:tumblr_app_host, s:tumblr_app_blog, a:action]
   let html = s:tumblr_app_html_format
   let html = substitute(html, "__ACTION__", join(action, "/"), '')
   let html = substitute(html, "__TITLE__", a:title, '')
   let html = substitute(html, "__BODY__", a:body, '')
   let file_path = tempname().".html"
   call writefile([html], file_path,'')
   let saved = g:openbrowser_open_filepath_in_vim
   try
      let g:openbrowser_open_filepath_in_vim = 0
      call openbrowser#open(file_path)
   finally
      let g:openbrowser_open_filepath_in_vim = saved
   endtry
endfunction

function! TumblrRequestGet(action)
   let action = [s:tumblr_app_host, s:tumblr_app_token, s:tumblr_app_blog, a:action]
   let null = "null"
   let false = "false"
   let true = "true"
   let cmd_curl = "curl -s ".join(action, "/")
   echo "operationg(".a:action.")... ".cmd_curl
   let json = system(cmd_curl)
   "echo json
   return eval(json)
endfunction

function! TumblrCreatePost()
   let title = getline(1)
   let lines = join(getline(2, line("$")), "\r")
   call TumblrRequestPost('new', title, lines)
endfunction

function! TumblrUpdatePost(id)
   let title = getline(1)
   let lines = join(getline(2, line("$")), "\r")
   call TumblrRequestPost(a:id.'/update', title, lines)
endfunction

function! TumblrCreateDraft()
endfunction

function! TumblrUpdateDraft(id)
endfunction

function! TumblrReadPost(id)
   new
   let b:blog = TumblrRequestGet(a:id)
   exec "set filetype=".b:blog.format
   let body = b:blog.body
   call append(0, split(body, "\n", 1))
endfunction

function! TumblrReadPostTitles()
   return TumblrRequestGet("posts")
endfunction

function! TumlrReadDraftTitles()
   return TumblrRequestGet("drafts")
endfunction

" {"word": "auth"
" {"word": "posts"
" {"word": "drafts"
" {"word": "clear token"


let s:unite_source = {
	 \   'name': 'tumblr',
	 \ }

function! s:unite_source.gather_candidates(args, context)
   let lines = TumblrReadPostTitles()
   let rtn = map(lines, '{
	    \ "word": v:val,
	    \ "source": "tumblr",
	    \ "kind": "command",
	    \ "action__command": "call TumblrReadPost(\"".v:key."\")",
	    \ }')
   "echo values(rtn)
   return values(rtn)
endfunction

call unite#define_source(s:unite_source)
unlet s:unite_source


