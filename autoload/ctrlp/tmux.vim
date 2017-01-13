if ( exists('g:loaded_ctrlp_tmux') && g:loaded_ctrlp_tmux ) || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_tmux = 1

call add(g:ctrlp_ext_vars, {
  \ 'init': 'ctrlp#tmux#init()',
  \ 'accept': 'ctrlp#tmux#accept',
  \ 'lname': 'tmux-manager',
  \ 'sname': 'tmux',
  \ 'type': 'line',
  \ 'sort': 0,
  \ 'specinput': 0,
  \ })

let s:text     = ''
function! ctrlp#tmux#init() abort
  return s:text
endfunction

function! ctrlp#tmux#accept(mode, str) abort
  let l:session = matchstr(a:str, '^[^:]*')
  let com = s:com . l:session
  execute 'silent !' . com
  :redraw!
  call ctrlp#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#tmux#id() abort
  return s:id
endfunction

function! ctrlp#tmux#start(...) abort
  if a:0 == 1
    if  a:1 ==? 'w'
      let s:com = 'tmux select-window -t '
      let s:text = split(system('tmux list-windows'), '\n')
    elseif a:1 ==? 's'
      let s:com = 'tmux switch-client -t '
      let s:text = split(system('tmux list-sessions'), '\n')
    else
      echohl ErrorMsg | echo 'Usage:CtrlPTmux [s|w]' | echohl none
      return 1
    endif
  else
    let s:com  = 'tmux switch-client -t '
    let s:text = split(system('tmux list-sessions'), '\n')
  endif

  :call ctrlp#init(ctrlp#tmux#id()) 
endfunction

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
