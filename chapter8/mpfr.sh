#!/bin/bash


./configure --prefix=/usr \
	--disable-static \
	--enable-thread-safe \
	--docdir=/usr/share/doc/mpfr-${VERSION} \
	&& make \
	&& make html \
	&& make install \
	&& make install-html

