
## native VIM

vimrc:

```
"==================================SpellCheck========================================================
"Native Vim Spelling
:imap <F7> <C-o>:set spell! spelllang=en_us<CR>
"quick spell fix: <Ctrl+F> autoFix close to cursor 
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
"quick spell fix undo: <Esc+u>
nmap <c-f> [s1z=<c-o>
```

using

```
]s – Find the misspelled word after the cursor 
[s – Find the misspelled word before the cursor
z= -  to find suggestions
```


## plugins - vimspell.vim

* will disable the native spell

install

```
(1) download and put in ~/.vim/plugin/

https://www.vim.org/scripts/script.php?script_id=465


:~/.vim$ 
plugin/
├── doc
│   └── vimspell.txt
└── vimspell.vim

(2) enable at vimrc:

:set dictionary=/usr/share/dict/words

```

usage

```
ctrl-n, ctrl-p    - next/previous word completion 
                    (similar word in current file)

ctrl-x ctrl-l (ctrl-n/p)    - line completion


//vimrc:
:set dictionary=/usr/share/dict/words
//enable this:
ctrl-x ctrl-k     - dictionary completion
```


