#!/bin/bash


export LFS=${1}
shift

# sanity check
if [ ${LFS} == "" ]; then
	exit 1 # FIXME write a useful message!
fi

chmod ugo+x scripts/preparechroot.sh
sudo ./scripts/preparechroot.sh ${LFS}

sudo chroot "$LFS" /usr/bin/env -i \
	HOME=/root \
	TERM="$TERM" \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/usr/bin:/usr/sbin \
	/usr/bin/bash --login +h $@

chmod ugo+x scripts/teardownchroot.sh
sudo ./scripts/teardownchroot.sh ${LFS} ${USER} $(id -gn)
