#!/bin/bash


./configure --prefix=/usr \
	&& make \
	&& make install

install -d -m755 /usr/share/doc/sed-4.8
