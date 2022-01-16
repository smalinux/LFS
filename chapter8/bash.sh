#!/bin/bash


./configure --prefix=/usr \
	--docdir=/usr/share/doc/bash-${VERSION} \
	--without-bash-malloc \
	--with-installed-readline \
	&& make \
	&& make install
