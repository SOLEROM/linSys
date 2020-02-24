## working with udev

```
info -a -p $(udevadm info -q path -n /dev/ttyUSB1)
```



```
udevadm info --export-db
```
