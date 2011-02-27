#!/usr/bin/env bash

# Location of beta firmware file containing proprietary data
FIRMWARE_URL="http://www.stack.nl/~brama/flytouch2/cm6_v0.img.bz2"
FIRMWARE_MD5="c241a156876109a57eee940e1c02401b"

PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin

# run this script from the directory the script is in
TOOLDIR=$(dirname $0)

P="$(TOOLDIR)/proprietary"
mkdir -p "$P"

# has md5sum been installed?
which md5sum || { echo "Couldn't find md5sum. Install: sudo apt-get install coreutils on debian/ubuntu"; exit 1; }

# has unyaffs-4k been compiled?
UNYAFFS="$(TOOLDIR)/unyaffs/unyaffs-4k"

if ! [ -x "$UNYAFFS" ] 
then
	echo "Building $UNYAFFS"
	cd "$(TOOLDIR)/unyaffs" && make
	if ! [ -x "$UNYAFFS" ]
	then
		echo "Build failed."
		exit 1
	fi
fi

# fetch firmware file
FIRMWAREFILE = "$(TOOLDIR)/proprietary/system.img"

if [ ! -f "$FIRMWAREFILE" ]
then
	wget -O "$FIRMWAREFILE.bz2" "$FIRMWARE_URL" && bunzip2 "$FIRMWAREFILE.bz2"
fi

md5=0
[ -f "$FIRMwAREFILE" ] || {
	echo "Failed to fetch $FIRMWARE_URL"
	exit 1
}

# verify md5
md5=$(md5sum "$FIRMwAREFILE")
if [ "$md5" != "$FIRMWARE_MD5" ]
then
	echo "MD5Sum doesn't match, bailing out."
	echo "Expected: $FIRMWARE_MD5"
	echo "Got: $md5"
	exit 1
fi

# bail on errors
set -e 

TMPROOT=$(mktemp -d)

cleanup() {
	[ -d $TMPROOT ] && rm -rf $TMPROOT
}

trap cleanup exit

cd $TMPROOT
"$UNYAFFS" "$FIRMwAREFILE"

# gps
mkdir -p "$P/gps/system"
tar -cf - etc/firmware/gps/igps.bin lib/igps.so | tar -C "$P/gps/system" -xf -

# multimedia
mkdir -p "$P/multimedia/system"
tar -cf - lib/lib7280enc.so lib/libavcodec.so lib/libavformat.so lib/libavutil.so lib/libdecx170h.so lib/libdecx170m.so lib/libdecx170m2.so lib/libdecx170p.so lib/libdecx170rv.so lib/libdecx170v.so lib/libdwlx170.so lib/libhwdecinterface.so lib/libmm_dma.so lib/libomx_*.so lib/libopencore*.so lib/libparser.so lib/libswscale.so lib/libwmapro.so lib/libx170j.so lib/hw/overlay.default.so etc/pvplayer.cfg | tar -C "$P/multimedia/system" -xf -

# opengl
mkdir -p "$P/opengl/system"
tar -cf - lib/modules/galcore.ko lib/libGAL.so lib/libGLESv1_CM.so lib/libGLESv2.so lib/libGLESv2SC.so lib/egl/libEGL_VIVANTE.so lib/egl/libGLES_android.so lib/egl/libGLESv1_CM_VIVANTE.so lib/egl/libGLESv2_VIVANTE.so lib/egl/egl.cfg bin/busybox bin/inshal | tar -C "$P/opengl/system" -xf -

# sensors
mkdir -p "$P/sensors/system"
tar -cf - lib/hw/sensors.default.so | tar -C "$P/sensors/system" -xf -

# sound
mkdir -p "$P/sound/system"
tar -cf - lib/hw/alsa.default.so lib/libasound.so lib/libaudio.so | tar -C "$P/sound/system" -xf -

# wifi
mkdir -p "$P/wifi/system"
tar -cf - etc/firmware/rt2870.bin etc/Wireless/RT2870STA/RT2870STA.dat lib/modules/rt2070sta.ko | tar -C "$P/wifi/system" -xf -
