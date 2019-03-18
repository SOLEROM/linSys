# taglist

## about:
* manual:

http://vim-taglist.sourceforge.net/manual.html

## install

```
download:
https://datapacket.dl.sourceforge.net/project/vim-taglist/vim-taglist/4.6/taglist_46.zip

and put in :
~/.vim/bundle$
taglist/
├── doc
│   └── taglist.txt
└─ plugin
    └── taglist.vim

```

## vimrc

```
"==================================plugin:taglist=====================================================
nnoremap <silent> <F5> :TlistToggle<CR>	"enable taglist"
"let Tlist_GainFocus_On_ToggleOpen = 1  "focus on taglist on load"
let Tlist_Exit_OnlyWindow = 1		"close taglist on exit"
nnoremap <tab> <C-w>t			"tab to focus on taglist window"
```


