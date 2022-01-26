#!/bin/bash


make mrproper

make defconfig

make

make modules_install

# FIXME replace the num to some generic var
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.13.12-lfs-11.0
cp -iv System.map /boot/System.map-5.13.12
cp -iv .config /boot/config-5.13.12

install -d /usr/share/doc/linux-5.13.12
cp -r Documentation/* /usr/share/doc/linux-5.13.12

