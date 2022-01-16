#!/bin/bash

./configure --prefix=/usr \
	--disable-static \
	--docdir=/usr/share/doc/expat-${VERSION} \
	&& make \
	&& make install

install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-${VERSION}
