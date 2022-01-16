#!/bin/bash


./configure --prefix=/usr --docdir=/usr/share/doc/automake-${VERSION} \
	&& make \
	&& make install

