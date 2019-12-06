# new repo form cmd

## api curl

* use from scripts:

```
curl -H "Content-Type:application/json" http://192.168.2.3:85/api/v4/projects?private_token=XXXXXXX -d "{ \"name\": \"$1\" }"
```

* Push an existing folder

```
cd existing_folder
git init
git remote add origin git@192.168.2.3:vlad/XXXX.git
git add .
git commit -m "Initial commit"
git push -u origin master

```

## use gitlab cmd tool

TBD
