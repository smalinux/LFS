#!/bin/bash


./configure --prefix=/usr

sed -e 's/__attribute_nonnull__/__nonnull/' \
 -i gnulib/lib/malloc/dynarray-skeleton.c

make \
	&& make install
