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

# GitHubServer

```
setting->deployKeys
 ->add->paste-<<(1)PUBLIC_KEY>>
   ->[v]allow-write-access
```

# LocalMachine

```
git clone <repo>  //<repo>:USE SSH option
git clone git@github.com:<(3)USER>/<(3)GIT-NAME>.git
git clone git@github.com:SOLEROM/test1.git
```


* add files

```
git add c
git commit c -m "add file"
git push
```


