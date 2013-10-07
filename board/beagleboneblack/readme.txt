This configuration is intended as a base image, it doesn't have support
for things like WiFi and HDMI either in the kernel or packages.

The console will be on the debug serial header (J1).

You'll need a spare MicroSD card with at least the first two partitions:

1) Type e (FAT16), the bootloader partition
2) Type 83 (Linux), the root fs

Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
and from the buildroot project top level directory:
(remember to replace /dev/sdc* with the appropriate device name!)

***** WARNING: Double check that /dev/sdc is your MicroSD card *****
*****      It might be /dev/sdb or some other device name      *****
***** Failure to do so may result in you wiping your hard disk *****

1. Unmount the filesystem(s) if they're already mounted, usually...

   # for fs in `grep /dev/sdc /proc/mounts|cut -d ' ' -f 1`;do umount $fs;done

   ...should work

2. Blank the partition table out

   # sudo dd if=/dev/zero of=/dev/sdc bs=1024 count=1024

3. Set up the partitions

   # sudo sfdisk --in-order --Linux --unit M /dev/sdc <<-__EOF__
1,48,0xE,*
,,,-
__EOF__

4. Format and copy the bootloaders to the first partition
   # sudo mkfs.vfat -F 16 -n boot /dev/sdc1
   <mount /dev/sdc1>
   # cp output/images/MLO output/images/u-boot.img <mount point>
   <umount /dev/sdc1>

5. Fill up the second (filesystem) partition
   # sudo dd if=output/images/rootfs.ext2 of=/dev/sdc2 bs=1M

6. Remove the MicroSD card from your linux PC and put it into your BeagleBone
   Black.

7. Boot! You're done!

----------
Notes

1. To use USB, run "modprobe musb_dsps" on the target.

