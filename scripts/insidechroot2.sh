#!/bin/bash


touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp

export LFS=""
cd sources


# Chapter 7.
for package in libstdc++ gettext bison perl python texinfo util-linux; do
	echo -n ""
	#source ./scripts/packageinstall.sh 7 $package
done
