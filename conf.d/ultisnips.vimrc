NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-L>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ulti_expand_res = 0 "default value, just set once
function! s:ulti_expand_and_get_res()
	call UltiSnips#ExpandSnippetOrJump()
	echo g:ulti_expand_or_jump_res
	return  g:ulti_expand_or_jump_res > 0
endfunction
function! s:insert_carriage_return()
	return "\<CR>"
endfunction

inoremap <silent> <Plug>(smart_ulti_expand) <C-r>=<SID>ulti_expand_and_get_res() ?"": <SID>insert_carriage_return()<CR>
imap <buffer> <CR> <Plug>(smart_ulti_expand)
