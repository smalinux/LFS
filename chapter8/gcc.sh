#!/bin/bash


sed -e '/static.*SIGSTKSZ/d' \
 -e 's/return kAltStackSize/return SIGSTKSZ * 4/' \
 -i libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp

case $(uname -m) in
 x86_64)
 sed -e '/m64=/s/lib64/lib/' \
 -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd build

../configure --prefix=/usr \
	LD=ld \
	--enable-languages=c,c++ \
	--disable-multilib \
	--disable-bootstrap \
	--with-system-zlib \
	&& make \
	&& make install

rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/${VERSION}/include-fixed/bits/

chown -v -R root:root \
 /usr/lib/gcc/*linux-gnu/${VERSION}/include{,-fixed}

ln -svr /usr/bin/cpp /usr/lib

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/${VERSION}/liblto_plugin.so \
 /usr/lib/bfd-plugins/

mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
