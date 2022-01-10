#!/bin/bash

# fdisk - for setup disks...

#echo ${LFS_DISK}
sudo fdisk ${LFS_DISK} << EOF
o
n
p
1

+100M
a
n
p
2


p
w
q
EOF

# setup file systems...
sudo mkfs -t ext2 -F ${LFS_DISK}1
sudo mkfs -t ext2 -F ${LFS_DISK}2
