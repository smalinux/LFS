#!/bin/bash


./configure --prefix=/usr \
	--disable-static \
	--sysconfdir=/etc \
	--docdir=/usr/share/doc/attr-${VERSION} \
	&& make \
	&& make install
