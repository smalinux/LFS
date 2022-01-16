#!/bin/bash


./configure --prefix=/usr --docdir=/usr/share/doc/gperf-${VERSION} \
	&& make \
	&& make install
