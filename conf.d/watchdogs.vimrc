NeoBundle "osyo-manga/vim-watchdogs"

" quickfix を閉じる
let g:quickrun_config["watchdogs_checker/_"] = {
\       "hook/close_quickfix/enable_exit" : 1,
\}

" watchdogs.vim の設定を追加
call watchdogs#setup(g:quickrun_config)

" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

" バッファに書き込み後、1度だけ行われる
let g:watchdogs_check_CursorHold_enable = 1
