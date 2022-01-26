#!/bin/bash


export LFS=""
cd sources

# 10.2. Creating the /etc/fstab File
cat > /etc/fstab << "EOF"
# Begin /etc/fstab
# file system mount-point type options dump fsck
# order
/dev/sda2 / ext2 defaults 1 1
/dev/sda1 /boot ext2 defaults 0 0
#/dev/<yyy> swap swap pri=1 0 0
proc /proc proc nosuid,noexec,nodev 0 0
sysfs /sys sysfs nosuid,noexec,nodev 0 0
devpts /dev/pts devpts gid=5,mode=620 0 0
tmpfs /run tmpfs defaults 0 0
devtmpfs /dev devtmpfs mode=0755,nosuid 0 0
# End /etc/fstab
EOF


# Chapter 10.
#source ./scripts/packageinstall.sh 10 linux


# 10.3.2. Configuring Linux Module Load Order
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf
install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true
# End /etc/modprobe.d/usb.conf
EOF


# 10.4.2. GRUB Naming Conventions
grub-install --target i386-pc /dev/sda


# 10.4.4. Creating the GRUB Configuration File
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5
insmod ext2
set root=(hd0,2)
# put the kernel version in a global var
menuentry "GNU/Linux, Linux 5.13.12-lfs-11.0" {
	# FIXME replace /dev/sda2 to ${LFS_DISK}
	linux /boot/vmlinuz-5.13.12-lfs-11.0 root=/dev/sda2 rootwait rootdelay=10 ro
}
EOF
