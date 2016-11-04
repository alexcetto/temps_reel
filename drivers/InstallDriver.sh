#!/bin/sh
driverModule="sensor"
driverName="MySensor"
deviceName="SensorDevice"
modeDevice="a+w"
insmod ${driverModule}.ko
majorNumber=$(awk '$2~/mySensor/ {print $1}' /proc/devices)
mknod /dev/${deviceName}0 c $majorNumber 0
mknod /dev/${deviceName}1 c $majorNumber 1
mknod /dev/${deviceName}2 c $majorNumber 2
mknod /dev/${deviceName}3 c $majorNumber 3
chmod ${modeDevice} /dev/${deviceName}[0­3]
