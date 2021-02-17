#!/bin/bash 

configure_apt(){
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
}

configure_users(){
    curl -L https://get.oh-my.fish | fish
    chsh -s /usr/bin/fish
    omf install fishbone
}

upgrade_system(){
    apt-get update -y
    apt-get upgrade -y
}

install_software(){
    apt-get install -y docker.io kubeadm kubectl kubelet vim qemu-guest-agent openssh-server cloud-init cloud-guest-utils
    update-grub
}


clean(){
    apt-get clean
}


configure_apt
upgrade_system
install_software
passwd --delete root
#configure_users
#clean
