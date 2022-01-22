#!/bin/bash


./configure --prefix=/usr \
	--build=$(support/config.guess) \
	--host=$LFS_TGT \
	--without-bash-malloc \
	&& make \
	&& make DESTDIR=$LFS install

#XXX
#mv $LFS/usr/bin/bash $LFS/bin/bash

ln -sv bash $LFS/bin/sh
# FIXUP! Oh-god! this line not exist on LFS project. I spent 1 day in debugging
# because of (/bin/sh: command not found) error!
ln -sv bash $LFS/usr/bin/sh
