" CtrlP
nnoremap [CtrlP] <Nop>
nmap <C-p> [CtrlP]
nnoremap [CtrlP]<C-p> :<C-u>CtrlP<CR>
nnoremap [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap [CtrlP]f :<C-u>CtrlPFunky<CR>
nnoremap [CtrlP]l :<C-u>CtrlPLine<CR>
nnoremap [CtrlP]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [CtrlP]q :<C-u>CtrlPQuickfix<CR>
nnoremap [CtrlP]s :<C-u>CtrlPMixed<CR>
nnoremap [CtrlP]t :<C-u>CtrlPTag<CR>

" VIMRC
nnoremap [vimrc] <Nop>
nmap <Space>. [vimrc]
nnoremap [vimrc]t :<C-u>tabedit $MYVIMRC<CR>
nnoremap [vimrc]s :<C-u>source $MYVIMRC<CR>
nnoremap [vimrc]o :<C-u>edit $MYVIMRC<CR>
nnoremap [vimrc]cd :<C-u>cd ~/.vim<CR>
