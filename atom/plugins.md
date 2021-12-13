# atom plugins

* TODO: add plugins of atom here




## keys
* https://atom.io/packages/atom-shortcuts (ctrl+tildaButton)

## editor
* https://atom.io/packages/minimap
* https://atom.io/packages/markdown-writer
* https://atom.io/packages/click-link  (ctrl+mouseClick)

* https://atom.io/packages/autocomplete  (ctrl + space)

* https://atom.io/packages/cursor-history  

* https://atom.io/packages/nav-panel-plus

```
## cursor-history
'atom-workspace':
  'ctrl-i': 'cursor-history:next'
  'ctrl-o': 'cursor-history:prev'
  'ctrl-u': 'cursor-history:next-within-editor'
  'ctrl-y': 'cursor-history:prev-within-editor'
```
## markdown

* https://atom.io/packages/markdown-preview  (shift+ctrl+m)
* https://atom.io/packages/markdown-folding

## tabs
* https://atom.io/packages/maximize-panes  (ctrl+shift+enter)

## search
* https://atom.io/packages/atom-search-everywhere

## spell
* https://atom.io/packages/spell-check  (ctrl+shift+:)

```
sudo apt-get install hunspell-en-gb

>dpkg-reconfigure locales
to set
>echo $LANG
en_US.UTF-8


```

## navigation
* https://github.com/t9md/atom-open-this  (shift+z)


```
'atom-workspace atom-text-editor:not([mini])':
  'shift-z': 'open-this:here'
  'shift-x': 'open-this:split-right'
```

* https://atom.io/packages/navigate

## bookmarks
* https://atom.io/packages/file-bookmark (side panel)

## pdf
* https://atom.io/packages/pdf-view


## todo/tasks
* https://atom.io/packages/tasks
* https://atom.io/packages/todo-show (shift+alt+T)


## terminal
* https://atom.io/packages/termrk  (alt-space)

```
use: alt-space: toggle terminal panel
may be used in ubuntu need to remap
```



## git
* https://atom.io/packages/git-log

## ssh
* https://atom.io/packages/remote-ssh

## projects
* https://atom.io/packages/project-manager  (ctrl+escape)

```
keymap.cson
===========
'.platform-linux':
  'ctrl-escape': 'project-manager:list-projects'
```
* https://atom.io/packages/project-viewer

# visual

## background
* https://atom.io/packages/global-background

```
~/.atom/packages/global-background/keymaps/background.cson
==========================================================
'atom-workspace':
  'ctrl-alt-t': 'global-background:stop-refresh'
  'ctrl-alt-y': 'global-background:start-refresh'

```



# programming language

## python
* https://atom.io/packages/autocomplete-python
* kite https://help.kite.com/article/60-using-the-atom-plugin

* https://atom.io/packages/python-tools


```
ctrl-alt-u	python-tools:show-usages
ctrl-alt-g	python-tools:goto-definition		
ctrl-alt-e	python-tools:select-all-string
```



## ide
* https://atom.io/packages/ide-cpp

##
