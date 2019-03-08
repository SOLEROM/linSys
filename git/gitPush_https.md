# working with https clone

## config global

* will store the password at plain txt

```
git config --global user.name "your username"
git config --global user.password "your password"


cat ~/.gitconfig
================
	name = your username
	email = admin@example.com
	password = your password
[credential]
	helper = store
[push]
	default = simple
```


## store

* will store the password at plain txt

```
git config --global credential.helper store
git push

cat ~/.git-credentials 
======================
https://XXXXX%40gmail.com:YYYYYY@github.com

	XXX YYY will be at plain txt !!!!

```

## cache

* will have a socket for defined time 

```
git config --global credential.helper cache		// 15 min
git config --global credential.helper 'cache --timeout=3600' // time in sec
git push

file ~/.git-credential-cache/socket 
~/.git-credential-cache/socket: socket
```


