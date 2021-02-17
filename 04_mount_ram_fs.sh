#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

NEW_ROOT=/mnt

mount --bind /dev $NEW_ROOT/dev
mount --bind /dev/pts $NEW_ROOT/dev/pts
mount --bind /proc $NEW_ROOT/proc
mount --bind /sys $NEW_ROOT/sys



