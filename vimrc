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
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tsukkee/unite-tag'
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

