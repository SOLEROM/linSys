#  ~/.vimrc  line numbers 

```
"==================================LINE-NUMBERS=======================================================
set number		"display numebr on load"
set numberwidth=3	"set width column for numbers"
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"F2 to toggle number display
noremap <F2> :set invnumber<CR>
inoremap <F2> <C-O>:set invnumber<CR>
"F3 for relative numbers
noremap <F3> :set number! relativenumber!<CR>
inoremap <F3> <C-O>:set nonumber! norelativenumber!<CR>
```
