#!/bin/bash


export LFS=${1}

# sanity check
if [ ${LFS} == "" ]; then
	exit 1
fi

# chown of the world
chown -R root:root $LFS/tools
chown -R root:root $LFS/boot
chown -R root:root $LFS/etc
chown -R root:root $LFS/bin
chown -R root:root $LFS/lib
chown -R root:root $LFS/sbin
chown -R root:root $LFS/usr
chown -R root:root $LFS/var
case $(uname -m) in
	x86_64) chown -R root:root $LFS/lib64 ;;
esac

# make also another important places for my new system
mkdir -pv $LFS/dev
mkdir -pv $LFS/proc
mkdir -pv $LFS/sys
mkdir -pv $LFS/run

# NOTE this is a real low-level stuff
# make a symlink between machine A (host) to machine B (target)
# without is may be your keyboard will not working after this line :)
# https://www.kernel.org/doc/Documentation/admin-guide/devices.txt
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
#
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
	mkdir -pv $lFS/$(readlink $LFS/dev/shm)
fi
