# NERDTree

## install using pathogen

```
## instal pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## will add:
~/.vim/bundle$ ls ~/.vim/autoload
pathogen.vim

## install nedtree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```

## vimrc

```
"==================================plugin:nerdtree====================================================
"enable pathogen"
execute pathogen#infect()
map <C-o> :NERDTreeToggle<CR>		"NERDTree toogle with CTRL+O"
```


