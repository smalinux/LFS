#!/bin/bash


patch -Np1 -i ../sysvinit-2.99-consolidated-1.patch

make \
	&& make install
