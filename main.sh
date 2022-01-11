#!/bin/bash
	# you probable will need to create new user? username = lfs

export LFS=/mnt/lfs
# TGT=target
# you probable need to change that later if you want to build OS for beaglebone
# LFS_TGT=arch-vendor-linux-gnu
export LFS_TGT=x86_64-lfs-linux-gnu
export LFS_DISK=/dev/sda


sudo mkdir ${LFS}

# active mount points
sudo mount /dev/sda2 /mnt/lfs/
sudo mount /dev/sda1 /mnt/lfs/boot


# Install requirements
source ./scripts/requirements.sh


# lfs.sh: almost my main script, I will probable split these scripts & clean
# stuff later...
source ./scripts/lfs.sh

