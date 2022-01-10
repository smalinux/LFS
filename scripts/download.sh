#!/bin/bash

cat ./data/packages.csv | while read line; do
	NAME="`echo ${line} | cut -d\; -f1`"
	VERSION="`echo ${line} | cut -d\; -f2`"
	URL="`echo ${line} | cut -d\; -f3 | sed "s/@/${VERSION}/g"`"
	MD5SUM="`echo ${line} | cut -d\; -f4`"
	CHECKFILE="$(basename "${URL}")"

	#echo NAME $NAME
	#echo VERSION $VERSION
	#echo URL $URL
	#echo MD5SUM $MD5SUM
	#echo CHECKFILE $CHECKFILE

	# if the file is already there, then skip

	if [ ! -f ${CHECKFILE} ]; then
		wget ${URL}
		if ! echo "$MD5SUM $CHECKFILE" | md5sum -c >/dev/null; then
			rm -f "$CHECKFILE"
			echo "Verification of $CHECKFILE faild! MD5 mismatch!"
			exit 1
		fi
	fi
done
