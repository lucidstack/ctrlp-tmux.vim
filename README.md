# ctrlp-tmux.vim
Ever wanted to switch between tmux sessions seamlessly, inside vim? Well, today is the
day, folks!

[![asciicast](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1.png)](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1)


## Installation
Use your favourite method to get this repository, then add `tmux` to `g:ctrlp_extensions` in your `.vimrc`.
```
let g:ctrlp_extensions = ['buffertag', 'tag', 'tmux']
```

#### (Optional) Add a leader shortcut
```
  " Change Tmux sessions with CtrlP
  nnoremap <Leader>s :CtrlPTmux<CR>
```
