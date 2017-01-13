command! -nargs=? CtrlPTmux call ctrlp#tmux#start(<f-args>)
nnoremap <plug>(ctrlp-tmux) :<c-u>CtrlPTmux<cr>
