function! s:add_back_slash(line)
    if empty(a:line)
        return '\'
    elseif a:line[0] ==# "	" || a:line[0] !=# " "
        return '\'.a:line
    else
        let line = split(a:line, '\zs')
        echo line
        let line[0] = '\'
        return join(line, "")
    endif
endfunction

function! s:back_slash_linefeed()
    call setline(line("."), s:add_back_slash(getline(line("."))))
    return ""
endfunction


function! s:less(a, b)
    return a:a[0] == a:b[0] && a:a[1] < a:b[1] || a:a[0] < a:b[0]
endfunction

function! s:is_closed_bracket(begin, end)
    return s:less(searchpos(a:begin, "bn"), searchpos(a:end, "bn"))
endfunction

function! s:is_closed()
    return !(!s:is_closed_bracket("{", "}") || !s:is_closed_bracket("[", "]"))
endfunction

function! s:is_line_end()
    return col('$') == (getpos(".")[2])
endfunction

function! s:is_need_back_slash()
    return !s:is_closed() || !s:is_line_end()
endfunction


inoremap <silent> <Plug>(back_slash_linefeed)
\   <CR><C-r>=<SID>back_slash_linefeed()<CR><Right>

inoremap <silent><expr> <Plug>(smart_back_slash_linefeed)
\   <SID>is_need_back_slash() ? "\<CR>\<C-r>=\<SID>back_slash_linefeed()\<CR>\<Right>" : "\<CR>"


" いい感じに \ を付けて改行
imap <buffer> <CR> <Plug>(smart_back_slash_linefeed)

" 明示的に \ を付けて改行する場合
imap <buffer> <C-CR> <Plug>(back_slash_linefeed)

function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
