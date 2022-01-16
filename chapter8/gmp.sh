#!/bin/bash


./configure --prefix=/usr \
	--enable-cxx \
	--disable-static \
	--docdir=/usr/share/doc/gmp-${VERSION} \
	&& make \
	&& make html \
	&& make install \
	&& make install-html
