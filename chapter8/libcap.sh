#!/bin/bash


sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib \
	&& make prefix=/usr lib=lib install

chmod -v 755 /usr/lib/lib{cap,psx}.so
