#!/bin/bash


export LFS=""
cd sources

# Chapter 8.
for package in  man-pages iana-etc glibc zlib bzip2 xz zstd file readline \
	m4 bc flex tcl expect dejagnu binutils gmp mpfr mpc attr acl libcap \
	shadow gcc pkg-config ncurses sed psmisc gettext bison grep bash \
	libtool gdbm gperf expat inetutils less perl xmlparser intltool \
	autoconf automake kmod elfutils libffi openssl python ninja meson \
	coreutils check diffutils gawk findutils groff grub gzip iproute2 \
	kbd libpipeline make patch tar texinfo vim eudev man-db procps \
	util-linux e2fsprogs sysklogd sysvinit; do
	echo -n ""
	#source ./scripts/packageinstall.sh 8 $package
done


