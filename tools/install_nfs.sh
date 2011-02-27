#!/usr/bin/env bash

#
# This script copies an existing build on the local system to a 
# local root directory, meant to be exported by NFS as a root 
# filesystem. It allows for easy testing of builds.
#
# When testing this on the flytouch 2, use BurnTool to boot a 
# kernel with similar cmdline params:
#
# noinitrd init=/init root=/dev/nfs nfsroot=192.168.3.2:/spare/nfsroots/cyanogen.flytouch2,proto=tcp,nolock ip=192.168.3.16:192.168.3.2:192.168.3.1:255.255.255.0::eth0:off console=ttySAC3,115200
#
# 192.168.3.16: IP address of the device
# 192.168.3.2 : IP address of the nfs server
# 192.168.3.1 : gateway

PATH=/usr/local/bin:/usr/bin:/bin

# set destination rootdir
export NFSROOT=/spare/nfsroots/cyanogen.flytouch2
# location of the source
export SRCDIR=$HOME/src/cyanogenmod

restoreroot=""

[ -d "$NFSROOT" ] && {
	backuproot="$NFSROOT.$(date +%Y-%m-%d-%H:%M:%S)"
	echo "Moving old install to $backuproot"
	sudo mv "$NFSROOT" "$backuproot"

	echo -n "Preserve old cache + data dir (y/n)? "
	read yesno
	[ "$yesno" = "y" ]  && restoreroot="$backuproot"
}

[ -d "$NFSROOT" ] && {
	echo "Old install still at installation root. Giving up."
	exit 1
}

# assuming non-debug release
outdir="$SRCDIR/out/target/product/Imapx2x0"

if ! [ -d "$outdir/system" ]
then
	echo "No release build foound in $outdir, checking debug build"
	outdir="$SRCDIR/out/debug/target/product/Imap2x20"
	
	if [ ! -d "$outdir/system" ]
	then
		echo "No debug build found either, giving up."
		exit 1
	fi
fi

# Copy over system + root dir
mkdir "$NFSROOT" || { 
	echo "Failed to create dir $NFSROOT"
	exit 1
}

# Exit on any errors
set -e

tar -C "$outdir/root/" -cf - . | tar -C "$NFSROOT" -xpf -
tar -C "$outdir/system/" -cf - . | tar -C "$NFSROOT/system/" -xpf -

# patch init.rc to not mount flash paritions
sed -i -r 's/mount (rootfs|yaffs2)/#mount \1/' "$NFSROOT/init.rc"
# dump logcat info to a file for easy debugging
cat << EOF >> "$NFSROOT/init.rc"

service logcat /system/bin/logcat -r 1000 -n 5 -v time -f /data/local/logcat.log

EOF

# Optionally restore cache + data
if ! [ -z "$restoreroot" ]
then
	echo "Restoring cache + data dir"
	sudo tar -C "$restoreroot" -cf - data cache | sudo tar -C "$NFSROOT" -xpf -
fi

# XXX necessary to create symlink?
#cd "$NFSROOT/system/lib && ln -s egl/libEGL_VIVANTE.so

