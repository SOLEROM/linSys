# LocalMachine

generate keys

```
ssh-keygen -t rsa -b 4096 -C <(0)ACCOUNT>@gmail.com
<(1)pubFile / (2)passphrase>
```
add the keys

```
eval "$(ssh-agent -s)"
ssh-add <(1)PrivateKEY> 
```

* persistent

```
~/.ssh/config
=====================
AddKeysToAgent yes


# Github.com
Host github.com
  Preferredauthentications publickey
  IdentityFile <PATH-TO>gitKey_private_github

# Private GitLab instance
Host <LOCAL-IP>
  Preferredauthentications publickey
  IdentityFile <PATH-TO>/gitKey_private_gitlab
```


# GitHubServer

* add to the main git server to be used in all repos

```
setting->deployKeys
 ->add->paste-<<(1)PUBLIC_KEY>>
   ->[v]allow-write-access
```

# LocalMachine

* clone

```
git clone <repo>  //<repo>:USE SSH option
git clone git@github.com:<(3)USER>/<(3)GIT-NAME>.git
git clone git@github.com:SOLEROM/test1.git
```


* commit

```
git add c
git commit c -m "add file"
git push
```


