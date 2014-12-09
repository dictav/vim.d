lang ja_JP
let &t_Co=256
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

" Make gvim-only colorschemes work transparently in terminal vim 
NeoBundle 'CSApprox'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle "cohama/vim-hier"
NeoBundle "dannyob/quickfixstatus"
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'gkz/vim-ls'

"Import
runtime conf.d/lightline.vimrc
runtime conf.d/ctrlp.vimrc
runtime conf.d/key-mapping.vimrc
runtime conf.d/submode.vimrc
runtime conf.d/neocomplete.vimrc
runtime conf.d/quickrun.vimrc
runtime conf.d/watchdogs.vimrc
runtime conf.d/markdown.vimrc
runtime conf.d/gitgutter.vimrc
"runtime conf.d/ultisnips.vimrc
runtime conf.d/web.vimrc
runtime conf.d/ruby.vimrc
runtime conf.d/objc.vimrc
runtime conf.d/go.vimrc
runtime conf.d/vim.vimrc
NeoBundleCheck

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
