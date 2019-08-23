lang ja_JP
let &t_Co=256
set shell=/bin/bash
set encoding=utf-8
set nocompatible

if has('vim_starting')
set rtp+=~/vim_plugged/vim-plug
if !isdirectory(expand('~/vim_plugged/vim-plug'))
echo 'install vim-plug...'
call system('mkdir -p ~/vim_plugged/vim-plug')
call system('git clone https://github.com/junegunn/vim-plug.git ~/vim_plugged/vim-plug/autoload')
end
endif

call plug#begin('~/vim_plugged')
Plug 'junegunn/vim-plug', {'dir': '~/vim_plugged/vim-plug/autoload'}

Plug 'itchyny/lightline.vim'
Plug 'mattn/sonictemplate-vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'

" CtrlP
"==============================
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kaneshin/ctrlp-sonictemplate'
nnoremap [CtrlP] <Nop>
nmap <C-p> [CtrlP]
nnoremap [CtrlP]<C-p> :<C-u>CtrlP<CR>
nnoremap [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap [CtrlP]l :<C-u>CtrlPLine<CR>
nnoremap [CtrlP]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [CtrlP]q :<C-u>CtrlPQuickfix<CR>
nnoremap [CtrlP]s :<C-u>CtrlPMixed<CR>
nnoremap [CtrlP]t :<C-u>CtrlPTag<CR>


" Submode
"==============================
Plug 'kana/vim-submode'

" Markdown
"==============================
Plug 'godlygeek/tabular'


call plug#end()

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
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
vnoremap <C-y> "+y



"===============================================================================
" 設定
set background=dark
colorscheme hybrid
syntax on
set directory=~/.vim_tmp
set backupdir=~/.vim_tmp
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab
set number
set showcmd
if has('persistent_undo')
set undodir=~/.vim_tmp
set undofile
endif
set laststatus=2
