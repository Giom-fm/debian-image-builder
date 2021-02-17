#!/bin/bash
NEW_ROOT=/mnt

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -f debian.img