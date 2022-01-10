#!/bin/bash


# check if mounted
if ! grep -q "$LFS" /proc/mounts; then
	# Partitioning & Formatting
	source ./scripts/setupdisk.sh ${LFS_DISK}
	sudo mount ${LFS_DISK}2 ${LFS}
	sudo chown -v $USER ${LFS}
fi

#
mkdir -pv $LFS/sources # downloaded our tarball
mkdir -pv $LFS/tools # the cross-compiler
# the normal FSH
mkdir -pv $LFS/boot
mkdir -pv $LFS/etc
mkdir -pv $LFS/bin
mkdir -pv $LFS/lib
mkdir -pv $LFS/sbin
mkdir -pv $LFS/usr
mkdir -pv $LFS/var

# FIXME https://youtu.be/3d6zSCc0x_o?t=1806
case $(uname -m) in
	x86_64) mkdir -pv $LFS/lib64 ;;
esac
