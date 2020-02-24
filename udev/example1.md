# example1


```
SUBSYSTEMS=="usb", ATTRS{idVendor}=="AAAA", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1"

```

## ID_MM_DEVICE_IGNORE and modemManger


```
Modem Manager can be configured to use different filter policies, and the udev tags such as ID_MM_DEVICE_IGNORE have no effect under the strict filter policy.
```


```
You can determine which policy Modem Manager is using on your system by viewing its status:

> sudo systemctl status ModemManager

   644 /usr/sbin/ModemManager --filter-policy=strict
```


```
 relevant service file is /lib/systemd/system/ModemManager.service

 ExecStart=/usr/sbin/ModemManager --filter-policy=default

 Options are default (just use the blacklist rules) or paranoid (like strict but also use the blacklist rule
```

* reload:

```
sudo systemctl daemon-reload
sudo systemctl restart ModemManager
```

* debug


```
To enable debug logging, run:
sudo mmcli -G DEBUG;

To watch the filter log messages, run:
journalctl -f | grep "ModemManager.*\[filter\]"

return ModemManager logging to its prior state, run:
sudo mmcli -G ERR

```


## more rules to ignore

* example

```
/etc/udev/rules.d/49-stm32.rules
================================
# 0483:5740 - STM32 in USB Serial Mode (CN5)
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ENV{ID_MM_TTY_BLACKLIST}="1"
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ENV{MTP_NO_PROBE}="1"
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ENV{ID_MM_PORT_IGNORE}="1"
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ENV{ID_MM_TTY_MANUAL_SCAN_ONLY}="1"

```
