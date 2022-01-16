#!/bin/bash


./configure --prefix=/usr --disable-static \
	&& make \
	&& make docdir=/usr/share/doc/check-${VERSION} install

