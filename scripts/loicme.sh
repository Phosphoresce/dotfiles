#!/bin/bash
DRIVE=$(df | grep "/home" | grep -Eo "\/dev\/sd[a-z]{1,}?[0-9]{1,}")
echo $DRIVE

#####dd if=/dev/zero of=$DRIVE bs=4096
#####shred -v $DRIVE
#####shred -v /dev/sd*
echo "Good night sweet prince."
./lock.sh
