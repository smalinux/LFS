#!/bin/bash


export LFS=${1}
export DIROWNER=${2}
export DIRGROUP=${3}

# sanity check
if [ ${LFS} == "" ]; then
	exit 1 # FIXME write a useful message!
fi


if [ -h $LFS/dev/shm ]; then
	rm -rf $lFS/$(readlink $LFS/dev/shm)
fi

#
umount $LFS/run
umount $LFS/sys
umount $LFS/proc

rm -f $LFS/dev/console
rm -f $LFS/dev/null

umount $LFS/dev/pts
umount  $LFS/dev

# chown of the world
chown -R $DIROWNER:$DIRGROUP $LFS/tools
chown -R $DIROWNER:$DIRGROUP $LFS/boot
chown -R $DIROWNER:$DIRGROUP $LFS/etc
chown -R $DIROWNER:$DIRGROUP $LFS/bin
chown -R $DIROWNER:$DIRGROUP $LFS/lib
chown -R $DIROWNER:$DIRGROUP $LFS/sbin
chown -R $DIROWNER:$DIRGROUP $LFS/usr
chown -R $DIROWNER:$DIRGROUP $LFS/var
case $(uname -m) in
	x86_64) chown -R $DIROWNER:$DIRGROUP $LFS/lib64 ;;
esac

