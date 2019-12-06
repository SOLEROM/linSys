#git aliases

* list repos on github

```
alias lsgit="curl -s  https://api.github.com/users/solerom/repos | grep -o 'git@[^\"]*' "
```
