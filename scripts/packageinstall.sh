#!/bin/bash


CHAPTER="$1"
PACKAGE="$2"

cat ./data/packages.csv | grep -i "^$PACKAGE;" | grep -iv "\.patch;" | while read line; do
	NAME="`echo ${line} | cut -d\; -f1`"
	export VERSION="`echo ${line} | cut -d\; -f2`"
	URL="`echo ${line} | cut -d\; -f3 | sed "s/@/${VERSION}/g"`"
	MD5SUM="`echo ${line} | cut -d\; -f4`"
	CHECKFILE="$(basename "${URL}")"
	#$ echo test-1.1.1.tar.gx | sed 's/\(.*\)\.tar\..*/\1/'
	DIRNAME="$(echo "$CHECKFILE" | sed 's/\(.*\)\.tar\..*/\1/')"

	#echo NAME $NAME
	#echo VERSION $VERSION
	#echo URL $URL
	#echo MD5SUM $MD5SUM
	#echo CHECKFILE $CHECKFILE

	# very important line -_-
	if [ -d ${DIRNAME} ]; then
		rm -rf ${DIRNAME}
	fi

	mkdir -pv "$DIRNAME"
	echo "Extracing ${CHECKFILE}..."
	tar -xf "$CHECKFILE" -C "$DIRNAME"


	pushd $DIRNAME
		if [ "$(ls -1A | wc -l)" == "1" ]; then
			mv $(ls -1A)/{*,.*} ./
		fi

		echo "Compiling $PACKAGE..."
		sleep 5

		mkdir -pv "../log/chapter$CHAPTER/"

		if ! source "../chapter$CHAPTER/$PACKAGE.sh" 2>&1 | tee "../log/chapter$CHAPTER/$PACKAGE.log" ; then
			echo "Compiling $PACKAGE FAILED!"
			popd
			exit 1
		fi

		echo "Done Compiling $PACKAGE"
	popd

done
