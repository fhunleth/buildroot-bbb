#!/bin/sh

TARGETDIR=$1
IMAGESDIR=$TARGETDIR/../images

# Pad the rootfs out a little for qemu to be happy
dd if=/dev/zero count=512 >> $IMAGESDIR/rootfs.ext2

