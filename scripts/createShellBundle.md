# create shell bundle

## install

```
sudo apt install sharutils
```

## preapre

```
cat refFile 
adasd

md5sum refFile > refFile.md5

cat refFile.md5 
cdfea0c03df2d58eeb8e509ffeab1c94  refFile
```

## create

```
uuencode refFile.md5 refFile.md5 > checkScript.sh
```

will make the next blob

```
checkScript.sh                                      
==============
begin 644 refFile.md5
J8V1F96$P8S`S9&8R9#4X965B.&4U,#EF9F5A8C%C.30@(')E9D9I;&4*
`
end
```

## edit

```
checkScript.sh 
==============
#/bin/bash

uudecode $0
md5sum -c refFile.md5
rm refFile.md5
exit 0

begin 644 refFile.md5
J8V1F96$P8S`S9&8R9#4X965B.&4U,#EF9F5A8C%C.30@(')E9D9I;&4*
`
end
```

## run

```
 ./checkScript.sh 
refFile: OK
```
