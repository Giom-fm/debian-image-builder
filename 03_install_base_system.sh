#!/bin/bash

NEW_ROOT=/mnt


install_base_system() {
    debootstrap \
        --verbose \
        --variant=minbase \
        --components=main,contrib,non-free \
        --include=linux-image-cloud-amd64,grub-cloud-amd64,curl,gnupg2,ca-certificates,vim \
        buster $NEW_ROOT http://ftp.de.debian.org/debian/

    grub-install --boot-directory=/mnt/boot --modules=part_msdos /dev/loop0
}

copy_configs(){
    cp -r etc/* $NEW_ROOT/etc/
    cp ./install.sh $NEW_ROOT/
    chmod +x $NEW_ROOT/install.sh
}


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


install_base_system
copy_configs





