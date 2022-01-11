#!/bin/bash


mkdir mpfr gmp mpc

tar -xf ../mpfr-*.tar.xz -C mpfr --strip-components=1
tar -xf ../gmp-*.tar.xz -C gmp --strip-components=1
tar -xf ../mpc-*.tar.gz -C mpc --strip-components=1

mv -v mpfr-* mpfr
mv -v gmp-* gmp
mv -v mpc-* mpc

mkdir -v build
cd build

../configure \
	--target=$LFS_TGT \
	--prefix=$LFS/tools \
	--with-glibc-version=2.11 \
	--with-sysroot=$LFS \
	--with-newlib \
	--without-headers \
	--enable-initfini-array \
	--disable-nls \
	--disable-shared \
	--disable-multilib \
	--disable-decimal-float \
	--disable-threads \
	--disable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libssp \
	--disable-libvtv \
	--disable-libstdcxx \
	--enable-languages=c,c++ \
	&& make \
	&& make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
 `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
