lang ja_JP

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
