" Language: Ruby (rspec)
" Author: pasela
" License: The MIT License

" ctrlp-funky-rspec provides filters for RSpec. It only provides 'describe'
" block by default. You can enable more blocks by options.
"
"
" g:ctrlp_funky_rspec_examples (default: 0)
"
"   Include/Exclude examples such as 'it', 'its', 'specify', ...
"
" g:ctrlp_funky_rspec_shared_examples (default: 0)
"
"   Include/Exclude shared examples such as 'shared_examples', 'include_examples', ...
"
" g:ctrlp_funky_rspec_contexts (default: 0)
"
"   Include/Exclude 'context'.
"
" g:ctrlp_funky_rspec_shared_contexts (default: 0)
"
"   Include/Exclude shared contexts such as 'shared_context' and 'include_context'.
"
" g:ctrlp_funky_rspec_hooks (default: 0)
"
"   Include/Exclude hooks such as 'before', 'after' and 'around'.
"
" g:ctrlp_funky_rspec_let_subject (default: 0)
"
"   Include/Exclude 'let' and 'subject'.
"
" g:ctrlp_funky_rspec_capybara (default: 0)
"
"   Include/Exclude capybara keywords such as 'feature', 'scenario', ...
"
" g:ctrlp_funky_rspec_custom_keywords (default: [])
"
"   Include custom keywords such as user defined aliases.

function! ctrlp#funky#rspec#filters()
  let filters = [
        \ { 'pattern': '\m\C^[\t ]*RSpec.\+[\t ]\+\S\+','formatter': []},
        \ { 'pattern': '\m\C^[\t ]*\(RSpec.\)\?\(describe\|context\)[\t ]\+\S\+','formatter': []},
        \ ]

  return filters
endfunction

" vim: fdm=marker
