#!/bin/bash

NEW_ROOT=/mnt


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

losetup --show -f ./debian.img
partprobe /dev/loop0
mount /dev/loop0p1 $NEW_ROOT