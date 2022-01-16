#!/bin/bash


sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr \
	&& make \
	&& make install

install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-${VERSION}/I18N-HOWTO
