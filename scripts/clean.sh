#!/bin/bash

export LFS=/mnt/lfs

cd $LFS
# sanity check
if [ $? == "0" ]; then
	sudo rm -r bin/ boot/ dev/ etc/ lib lib64/ proc/ run/ sbin/ sys/ tools/ usr/ var/
fi

cd $LFS/sources
# sanity check
if [ $? == "0" ]; then
	yes | rm -r binutils-2.37 gcc-11.2.0 glibc-2.34
	yes | rm -r log/ bash-5.1.8 binutils-2.37 coreutils-8.32 diffutils-3.8 file-5.40 findutils-4.8.0 gawk-5.1.0 gcc-11.2.0 glibc-2.34 grep-3.7 gzip-1.10 linux-5.13.12 m4-1.4.19 make-4.3 ncurses-6.2 patch-2.7.6 sed-4.8 tar-1.34
fi

