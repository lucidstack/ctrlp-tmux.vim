if ( exists('g:loaded_ctrlp_tmux') && g:loaded_ctrlp_tmux ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_tmux = 1

call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#tmux#init()',
  \ 'accept': 'ctrlp#tmux#accept',
  \ 'lname': 'tmux sessions',
  \ 'sname': 'tmux',
  \ 'type': 'line',
  \ 'sort': 0,
  \ 'specinput': 0,
  \ })

function! ctrlp#tmux#init()
  let s:sessions = split(system('tmux list-sessions'), '\n')
  return s:sessions
endfunction

function! ctrlp#tmux#accept(mode, str)
  let session = matchstr(a:str, '^[a-zA-Z0-9]*')
  let com = 'tmux switch-client -t ' . session
  execute "silent!" . com

  call ctrlp#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#tmux#id()
  return s:id
endfunction

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
