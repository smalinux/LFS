#!/bin/bash


./configure --prefix=/usr \
	--docdir=/usr/share/doc/procps-ng-${VERSION} \
	--disable-static \
	--disable-kill \
	&& make \
	&& make install
