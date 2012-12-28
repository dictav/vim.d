if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'rspec-result'
endif

"大文字と小文字を区別する
syntax case match

syntax match RSpecGreen /^[\.F]*\.[\.F]*$/
syntax match RSpecGreen /^.*, 0 failures$/
syntax match RSpecRed /F/
syntax match RSpecRed /^.*, [1-9]* failures.*$/
syntax match RSpecRed /^.*, 1 failure.*$/
syntax match RSpecRed /^ *(.*$/
syntax match RSpecRed /^ *expected.*$/
syntax match RSpecRed /^ *got.*$/
syntax match RSpecRed /^ *Failure\/Error:.*$/
syntax match RSpecRed /^.*(FAILED - [0-9]*)$/
syntax match RSpecRed /^rspec .*:.*$/
syntax match RSpecComment / # .*$/
syntax match RSpecNormal /^Failures:/
syntax match RSpecNormal /^Finished/
syntax match RSpecNormal /^Failed/

" 背景色
" highlight RSpecGreen   ctermfg=White ctermbg=Green guifg=White guibg=Green
" highlight RSpecRed     ctermfg=White ctermbg=Red   guifg=White guibg=Red
" highlight RSpecComment ctermfg=White ctermbg=Cyan  guifg=White guibg=Cyan
" highlight RSpecNormal  ctermfg=Black ctermbg=White guifg=Black guibg=White

" 文字色
highlight RSpecGreen   ctermfg=Green guifg=Green
highlight RSpecRed     ctermfg=Red   guifg=Red
highlight RSpecComment ctermfg=Cyan  guifg=Cyan
highlight RSpecNormal  ctermfg=White guifg=Black guibg=White

let b:current_syntax = 'rspec-result'

if main_syntax == 'rspec-result'
  unlet main_syntax
endif
