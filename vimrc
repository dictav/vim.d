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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'noahlh/html5.vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'CSApprox'
NeoBundle 'vim-ruby/vim-ruby'
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'ujihisa/shadow.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'itchyny/lightline.vim'

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
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=%l,%c%V%8P
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
let g:neocomplcache_keyword_patterns = {}
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_omni_patterns = {}

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Snippets expand
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" Enable omni completion.
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType vim setlocal omnifunc=complete#CompleteCSS

let g:neocomplcache_dictionary_filetype_lists = {
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
" eregex
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

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
" Tumblr
"let s:tumblr_app_host = "http://localhost:5000/"
let s:tumblr_app_host = "http://tumblr-app.herokuapp.com/"
let s:tumblr_app_token = "QELkJjkgUsDLMaHJh4DR16uC3kCEUHK2RXhNFv4I6GcU5GVAtb"
let s:tumblr_app_blog = "diclog"
let s:tumblr_app_html_format = ""
	 \."<!DOCTYPE HTML>"
	 \."<html lang='en'>"
	 \."<head>"
	 \."   <meta charset='UTF-8'>"
	 \."   <title>PUT TEST</title>"
	 \."   <script type='text/javascript'>"
	 \."   window.onload = function () {"
	 \."	  form = document.createElement('form');"
	 \."	  form.action = '__ACTION__';"
	 \."	  form.method = 'post';"
	 \."      inputs = __INPUTS__;"
	 \."	  for (key in inputs) {"
	 \."	     input = document.createElement('input');"
	 \."	     input.type = 'hidden';"
	 \."	     input.name = key;"
	 \."	     val = inputs[key];"
	 \."	     val=val.replace(/__LT__/g,'<');"
	 \."	     val=val.replace(/__GT__/g,'>');"
	 \."	     input.value = val;"
	 \."	     form.appendChild(input);"
	 \."	  };"
	 \."	  form.submit();"
	 \."   }"
	 \."   </script>"
	 \."</head>"
	 \."<body>"
	 \."<h1>Loading...</h1>"
	 \."</body>"
	 \."</html>"

function! TumblrAuth()
   call openbrowser#open(s:tumblr_app_host)
endfunction

function! TumblrRequestPost(action, params)
   let action = [s:tumblr_app_host, s:tumblr_app_blog, a:action]
   let html = s:tumblr_app_html_format
   let html = substitute(html, "__ACTION__", join(action, "/"), '')
   let eol = '\\\\n'
   let params = map(a:params, "substitute(v:val, '<', '__LT__', 'g')")
   let params = map(params, "substitute(v:val, '>', '__GT__', 'g')")
   let params = map(params, "substitute(v:val, '\\r', '".eol."', 'g')")

   let html = substitute(html, "__INPUTS__", string(params), '')

   let file_path = tempname().".html"
   call writefile([html], file_path,'')
   exec "sp ".file_path
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
   echo "operating(".a:action.")... ".cmd_curl
   let json = system(cmd_curl)
   "echo json
   return eval(json)
endfunction

function! TumblrCreatePost()
   "let title = getline(1)
   "let lines = join(getline(2, line("$")), "\r")
   let params = {
	    \ "title": getline(1),
	    \ "body":join(getline(2, line("$")), "\r"),
	    \ "format": &filetype
	    \}
   
   call TumblrRequestPost('new', params)
endfunction

function! TumblrUpdatePost(id)
"   let title = getline(1)
"   let lines = join(getline(2, line("$")), "\r")
   let params = {
	    \"title": getline(1),
	    \ "body":join(getline(2, line("$")), "\r")
	    \}
   call TumblrRequestPost(a:id.'/update', params)
})
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


"===============================================================================
" CoffeeScript
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"===============================================================================
" VimFiler
" デフォルトに設定
let g:vimfiler_as_default_explorer = 1

"===============================================================================
" Go
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
auto BufWritePre *.go Fmt
