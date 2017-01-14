# ctrlp-tmux.vim

Ever wanted to switch between tmux sessions or windows seamlessly, inside vim? Well, today is the
day, folks!

[![asciicast](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1.png)](https://asciinema.org/a/eey01oxa2bmp7pdfjrf7378z1)

## Feature

1. tmux session list and switch
2. tmux windows list and switch
3. tmux command list and execute(interactively)
4. tmux buffer list and paste

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
"w for select windows
"s for select sessions
"c for tmux command
"ci same as above,but allow user input thr argument of command
"b for tmux buffer
"bracket mean optional.Operation type is sessions without any argument.
:CtrlPTmux [s|w|c|ci|b]
```

#### (Optional) Add a leader shortcut

```vim
  " Change Tmux sessions with CtrlP
  nnoremap <Leader>s :CtrlPTmux<CR>
```

