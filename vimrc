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
" VimFiler
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

" Make gvim-only colorschemes work transparently in terminal vim 
NeoBundle 'CSApprox'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"
NeoBundle 'tpope/vim-surround'
" Template 
NeoBundle 'mattn/sonictemplate-vim'
" GitGutter
NeoBundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" Vital!
NeoBundle 'vim-jp/vital.vim'


"runtime! conf.d/*.vim
runtime conf.d/lightline.vimrc
runtime conf.d/ctrlp.vimrc
runtime conf.d/key-mapping.vimrc
runtime conf.d/submode.vimrc
runtime conf.d/neocomplete.vimrc
autocmd BufWinEnter *.rb runtime conf.d/ruby.vimrc
autocmd BufWinEnter *.{c,cpp,m,h} runtime conf.d/objc.vimrc
autocmd BufWinEnter *.go runtime conf.d/go.vimrc

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
