"===============================================================================
" Objective-C 
let g:quickrun_config['objc'] = {
\   'command': 'clang',
\	'cmdopt': '-framework Foundation',
\   'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
\   'tempfile': '%{tempname()}.m',
\   'hook/sweep/files': '%S:p:r',
\ }
