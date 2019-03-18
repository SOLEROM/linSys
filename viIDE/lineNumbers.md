#  ~/.vimrc  line numbers 

```
"==================================LINE-NUMBERS=======================================================
set number		"display numebr on load"
set numberwidth=3	"set width column for numbers"
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"F3 to toggle number display
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
"F4 for relative numbers
noremap <F4> :set number! relativenumber!<CR>
inoremap <F4> <C-O>:set nonumber! norelativenumber!<CR>
```
