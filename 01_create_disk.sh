#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

truncate --size 2G ./debian.img
parted -s ./debian.img -- mklabel msdos mkpart primary 1m 2g toggle 1 boot
losetup --show -f ./debian.img
partprobe /dev/loop0
mkfs.ext4 /dev/loop0p1
losetup -D