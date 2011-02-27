#!/usr/bin/env bash
PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin

# run this script from the directory the script is in
TOOLDIR=$(dirname $0)
echo "TOOLDIR: $TOOLDIR"

# has mkbootimg been installed on the system?
which mkimage || {
	echo "Install mkimage first: sudo apt-get install uboot-mkimage on debian/ubuntu"
	exit 1
}

# and cpio?
which cpio || {
	echo "Install cpio first: sudo apt-get install cpio on debian/ubuntu"
	exit 1
}

# has mkyaffs2image been compiled?
MKYAFFS2="$TOOLDIR/yaffs2/utils/mkyaffs2image"

if [ ! -x "$MKYAFFS2" ] 
then
	echo "Building $MKYAFFS2"
	( cd "$TOOLDIR/yaffs2/utils" && make )
	if [ ! -x "$MKYAFFS2" ]
	then
		echo "Build failed."
		exit 1
	fi
fi

# is the output dir present?
OUTDIR="$TOOLDIR/../../../../out/target/product/Imapx2x0"

if [ ! -d "$OUTDIR/root" -o ! -d "$OUTDIR/system" ]
then
	echo "Couldn't locate generated filesystems in $OUTDIR"
	exit 1
fi

# bail on errors
set -e 

TMPROOT=$(mktemp -d)

cleanup() {
	[ -d $TMPROOT ] && rm -rf $TMPROOT
}

trap cleanup exit

# locations of system dir and root dir
SYSDIR="$OUTDIR/system"
ROOTDIR="$OUTDIR/root"

#
# Create ramdisk.img
#
echo "Creating ramdisk.img ... "
rm -f "$OUTDIR/ramdisk.img"
# create intermediary ramdisk image
( cd $ROOTDIR && find ./ | cpio -H newc -o | gzip  ) > "$OUTDIR/ramdisk.gz"
mkimage -T ramdisk -A arm -C none -n "hRamdisk" -O linux  -a 0x41000000 -d "$OUTDIR/ramdisk.gz" "$OUTDIR/ramdisk.img"
rm "$OUTDIR/ramdisk.gz"

echo "Creating system.img ... "
rm -f "$OUTDIR/system.img"
"$MKYAFFS2" $SYSDIR $OUTDIR/system.img

echo "Creating userdata.img ... "
rm -f "$OUTDIR/userdata.img"
mkdir -p "$TMPROOT/userdata"
"$MKYAFFS2" "$TMPROOT/userdata" $OUTDIR/userdata.img

echo "Copying kernel ... "
cp "${TOOLDIR}/../proprietary/uImage" "$OUTDIR/uImage"

echo "Flash the following files in $OUTDIR to your tablet using BurnTool or IUW:"
echo "linux-kernel: uImage"
echo "linux-sys   : system.img"
echo "linux-udat  : userdata.img"
echo "linux-ram-disk: ramdisk.img"
