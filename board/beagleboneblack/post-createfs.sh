#!/bin/sh

#
# Post create filesystem hook
#  - Create the firmware images

TARGETDIR=$1
BOARDDIR=board/beagleboneblack
IMAGESDIR=$TARGETDIR/../images

$BOARDDIR/am335xpackager.py -c $BOARDDIR/bbb-sdcard.cfg -s $IMAGESDIR/MLO -u $IMAGESDIR/u-boot.img -r $IMAGESDIR/rootfs.ext2 -f $IMAGESDIR/bbb.fw -g $IMAGESDIR/bbb-sdcard.img
