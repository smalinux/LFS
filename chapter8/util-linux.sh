#!/bin/bash


./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
 --libdir=/usr/lib \
 --docdir=/usr/share/doc/util-linux-${VERSION} \
 --disable-chfn-chsh \
 --disable-login \
 --disable-nologin \
 --disable-su \
 --disable-setpriv \
 --disable-runuser \
 --disable-pylibmount \
 --disable-static \
 --without-python \
 --without-systemd \
 --without-systemdsystemunitdir \
 runstatedir=/run \
	&& make \
	&& make install
