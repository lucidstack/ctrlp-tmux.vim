command! CtrlPTmux call ctrlp#init(ctrlp#tmux#id())
nnoremap <plug>(ctrlp-tmux) :<c-u>CtrlPTmux<cr>
