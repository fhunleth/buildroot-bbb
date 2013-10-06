#!/bin/sh

TARGETDIR=$1
BOARDDIR=board/beagleboneblack
IMAGESDIR=$TARGETDIR/../images

# Build the "sdcard" image for qemu as similar as possible
# to what we build with the BBB
touch $IMAGESDIR/placeholder
$BOARDDIR/am335xpackager.py -c $BOARDDIR/bbb-sdcard.cfg -s $IMAGESDIR/placeholder -u $IMAGESDIR/placeholder -r $IMAGESDIR/rootfs.ext2 -f $IMAGESDIR/armerl.fw -g $IMAGESDIR/armerl-sdcard.img

