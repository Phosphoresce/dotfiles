#!/bin/bash
DRIVE=$(df | grep "/home" | grep -Eo "\/dev\/sd[a-z]{1,}?[0-9]{1,}")
echo $DRIVE

echo "Good night sweet prince."

# Quick zero wipe followed by secure wipe. Un-comment to arm.
#####dd if=/dev/zero of=$DRIVE bs=4096

# these will never run
#####shred -v -n1 $DRIVE
#####shred -v -n1 /dev/sd*

~/Scripts/lock.sh &
