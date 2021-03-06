#!/bin/bash


# check if mounted
if ! grep -q "$LFS" /proc/mounts; then
	# Partitioning & Formatting
	source ./scripts/setupdisk.sh ${LFS_DISK}
	sudo mount ${LFS_DISK}2 ${LFS}
	sudo chown -v $USER ${LFS}
fi

#
mkdir -pv $LFS/sources # downloaded our tarball
mkdir -pv $LFS/tools # the cross-compiler
# the normal FSH
mkdir -pv $LFS/boot
mkdir -pv $LFS/etc
mkdir -pv $LFS/bin
mkdir -pv $LFS/lib
mkdir -pv $LFS/sbin
mkdir -pv $LFS/usr
mkdir -pv $LFS/var

# FIXME https://youtu.be/3d6zSCc0x_o?t=1806
case $(uname -m) in
	x86_64) mkdir -pv $LFS/lib64 ;;
esac


# copy all my scripts to ${LFS}/sources/
# move to ${LFS}
cp -rf * "${LFS}/sources"
cd "${LFS}/sources"

export PATH="${LFS}/tools/bin:${PATH}"

# Start downloading the packages
source ./scripts/download.sh

# Compile these packages: chapter5: toolchain
for package in binutils gcc linux glibc libstdc++; do
	echo -n ""
	#source ./scripts/packageinstall.sh 5 $package
done

# Chapter 6.
for package in m4 ncurses bash coreutils diffutils file findutils gawk \
	grep gzip make patch sed tar xz binutils gcc xz; do
	echo -n ""
	#source ./scripts/packageinstall.sh 6 $package
done

# FIXUP
sudo cp -a /mnt/lfs/usr/lib/ld-linux-x86-64.so.2 /mnt/lfs/lib/
sudo cp -a /mnt/lfs/usr/bin/bash /mnt/lfs/bin/

chmod ugo+x scripts/preparechroot.sh
chmod ugo+x scripts/insidechroot.sh
chmod ugo+x scripts/insidechroot2.sh
chmod ugo+x scripts/insidechroot3.sh
chmod ugo+x scripts/insidechroot4.sh
chmod ugo+x scripts/insidechroot5.sh
chmod ugo+x scripts/teardownchroot.sh

sudo ./scripts/preparechroot.sh ${LFS}

# sudo ./scripts/chroot_bash.sh ${LFS} -c insidechroot.sh
# sudo ./scripts/chroot_bash.sh ${LFS} -c insidechroot2.sh
for script in "/sources/scripts/insidechroot.sh" \
	"sources/scripts/insidechroot2.sh" \
	"sources/scripts/insidechroot3.sh" \
	"sources/scripts/insidechroot4.sh" \
	"sources/scripts/insidechroot5.sh"; do

	echo "RUNNING ${script} CHROOT ENVIRONMENT..."
	sleep 3
	sudo chroot "$LFS" /usr/bin/env -i \
		HOME=/root \
		TERM="$TERM" \
		PS1='(lfs chroot) \u:\w\$ ' \
		PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/var/lib/snapd/snap/bin:/home/smalinux/.local/bin \
		/usr/local/bin/bash --login +h -c ${script}
done


sudo ./scripts/teardownchroot.sh ${LFS} ${USER} $(id -gn)

