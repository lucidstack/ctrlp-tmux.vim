if ( exists('g:loaded_ctrlp_tmux') && g:loaded_ctrlp_tmux )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_tmux = 1

call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#tmux#init()',
	\ 'accept': 'ctrlp#tmux#accept',
	\ 'lname': 'tmux sessions',
	\ 'sname': 'tmux',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#tmux#enter()',
	\ 'exit': 'ctrlp#tmux#exit()',
	\ 'opts': 'ctrlp#tmux#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#tmux#init()
  let s:sessions = split(system('tmux list-sessions'), '\n')
	return s:sessions
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#tmux#accept(mode, str)
  let session = matchstr(a:str, '^[a-zA-Z0-9]*')
  let com = 'tmux switch-client -t ' . session
  execute "silent!" . com

  call ctrlp#exit()
endfunction

" (optional) Do something after exiting ctrlp
function! ctrlp#tmux#exit()
  if (s:sessions)
    unlet! s:sessions
  endif
endfunction

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#tmux#id()
	return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/tmux.vim

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
