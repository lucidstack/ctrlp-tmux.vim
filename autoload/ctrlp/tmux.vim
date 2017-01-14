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

let s:text = ''
let s:mode = ''
function! ctrlp#tmux#init() abort
  return s:text
endfunction

function! ctrlp#tmux#accept(mode, str) abort
  let l:tmux_name = matchstr(a:str, '^[^:]*')
  let l:cmd_arg = ''
  if s:mode ==# 'ci'
      let l:cmd_arg=input(a:str.' ')
  endif
  if s:mode !=# 'b'
  execute s:com . l:tmux_name.' '.l:cmd_arg
  endif
  :redraw!
  call ctrlp#exit()
  if s:mode ==# 'b'
      "execute s:com.l:tmux_name
      let l:buffer=split(system(s:com.l:tmux_name),"\n")
      let l:line_no=line('.')
      for l:i in l:buffer
          call setline(l:line_no, getline('.') . l:i)
          let l:line_no+=1
      endfor
  endif
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#tmux#id() abort
  return s:id
endfunction

function! ctrlp#tmux#start(...) abort
  if a:0 == 1
    let s:mode=a:1
    if  a:1 ==# 'w'
      let s:com = 'silent !tmux select-window -t '
      let s:text = split(system('tmux list-windows'), '\n')
    elseif a:1 ==# 's'
      let s:com = 'silent !tmux switch-client -t '
      let s:text = split(system('tmux list-sessions'), '\n')
    elseif a:1 ==# 'c'
      let s:com = 'silent !tmux '
      let s:text = split(system('tmux list-command -F "#{command_list_name}: #{command_list_usage}"'), '\n')
    elseif a:1 ==# 'ci'
      let s:com = 'silent !tmux '
      let s:text = split(system('tmux list-command -F "#{command_list_name}: #{command_list_usage}"'), '\n')
    elseif a:1 ==? 'b'
      let s:com = 'tmux show-buffer -b '
      let s:text = split(system('tmux list-buffers'), '\n')
    else
      echohl ErrorMsg | echo 'Usage:CtrlPTmux [s|w|c|ci|b]' | echohl none
      return 1
    endif
  else
    let s:com  = 'silent !tmux switch-client -t '
    let s:text = split(system('tmux list-sessions'), '\n')
  endif

  :call ctrlp#init(ctrlp#tmux#id()) 
endfunction

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
