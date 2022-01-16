#!/bin/bash


./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/mpc-${VERSION} \
	&& make \
	&& make html \
	&& make install \
	&& make install-html
