# ctrlp-tmux.vim

Ever wanted to switch between tmux sessions or windows seamlessly, inside vim? Well, today is the
day, folks!

[![asciicast](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1.png)](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1)

## Installation

Use your favourite method to get this repository.

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
- [Shougo/dein.vim](https://github.com/Shougo/dein.vim)


Add `tmux` to `g:ctrlp_extensions` in your `.vimrc`(optional).

```vim
" example
let g:ctrlp_extensions = ['buffertag', 'tag', 'tmux']
```


## Usage

```viml
"w for select windows,s for select sessions
"bracket mean optional.Operation type is sessions without any argument.
:CtrlPTmux [w|s]
```

#### (Optional) Add a leader shortcut

```vim
  " Change Tmux sessions with CtrlP
  nnoremap <Leader>s :CtrlPTmux<CR>
```

