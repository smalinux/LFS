#!/bin/bash

#echo Hi, from hello.sh
#echo this is just test


# FIXME Take inputs from user instead of that....
echo Please, defile the name of your USB first,
echo Into ./main.sh file
echo use $ sudo dmesg to get the device name ....

# FIXME write this into README...
echo Please, use USB storage bigger than 10 GB at least...
echo use clean formated USB storage device

# format the USB
echo sudo dd if=/dev/zero of=/dev/sdb bs=8M
