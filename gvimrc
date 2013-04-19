"カラー設定
"カラー設定した後にCursorIMを定義する方法
colorscheme railscasts

if has('multi_byte_ime')
	highlight CursorIM guifg=NONE guibg=lightyellow
endif

"
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set visualbell

if has('gui_macvim')
	if has('gui_running')
		lang ja_JP
		set guifont=Menlo:h12
 		highlight CursorIM guifg=NONE guibg=lightyellow
	endif
endif

winpos  750 0
winsize 85 100

