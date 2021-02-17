#!/bin/bash
NEW_ROOT=/mnt

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

umount $NEW_ROOT/dev/pts
umount $NEW_ROOT/dev
umount $NEW_ROOT/proc
umount $NEW_ROOT/sys

