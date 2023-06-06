

# install

sudo apt-get install xbindkeys xbindkeys-config

# set default
xbindkeys --defaults > ~/.xbindkeysrc

# get keys

```
 xbindkeys --key
 xbindkeys --multikey
```


# edit and add to

vi $HOME/.xbindkeysrc


# reload

xbindkeys --poll-rc
