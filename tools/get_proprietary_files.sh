#!/usr/bin/env bash

# Location of beta firmware file containing proprietary data
FIRMWARE_URL="http://www.stack.nl/~brama/flytouch2/cm6_v0.img.bz2"
FIRMWARE_MD5="9126745cb5165cbc9b96fcd3ef562a50"

PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin

# run this script from the directory the script is in
TOOLDIR="$(pwd)/$(dirname $0)"

P="$TOOLDIR/../proprietary"
mkdir -p "$P"

# has md5sum been installed?
which md5sum || { echo "Couldn't find md5sum. Install: sudo apt-get install coreutils on debian/ubuntu"; exit 1; }

# has unyaffs-4k been compiled?
UNYAFFS="$TOOLDIR/unyaffs/unyaffs-4k"

if ! [ -x "$UNYAFFS" ] 
then
	echo "Building $UNYAFFS"
	( cd "$TOOLDIR/unyaffs" && make )
	if ! [ -x "$UNYAFFS" ]
	then
		echo "Build failed."
		exit 1
	fi
fi

# fetch firmware file
FIRMWAREFILE="$P/system.img"

if [ ! -f "$FIRMWAREFILE" ]
then
	wget -O "${FIRMWAREFILE}.bz2" "$FIRMWARE_URL" && bunzip2 "${FIRMWAREFILE}.bz2"
fi

md5=0
[ -f "$FIRMWAREFILE" ] || {
	echo "Failed to fetch $FIRMWARE_URL"
	exit 1
}

echo "Checking md5 checksum"

# verify md5
md5=$(md5sum "$FIRMWAREFILE" | awk '{ print $1 }')
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

echo "Extracting filesystem"

( cd $TMPROOT && "$UNYAFFS" "$FIRMWAREFILE" )

echo "Copying files"

# gps
mkdir -p "$P/gps/system"
tar -C "$TMPROOT" -cf - etc/firmware/gps/igps.bin lib/libigps.so | tar -C "$P/gps/system" -xf -

# multimedia
mkdir -p "$P/multimedia/system"
tar -C "$TMPROOT" -cf - lib/lib7280enc.so lib/libavcodec.so lib/libavformat.so lib/libavutil.so lib/libdecx170h.so lib/libdecx170m.so lib/libdecx170m2.so lib/libdecx170p.so lib/libdecx170rv.so lib/libdecx170v.so lib/libdwlx170.so lib/libhwdecinterface.so lib/liblx_ipc.so lib/libmm_dma.so lib/libomx_aacdec_sharedlibrary.so lib/libomx_amrdec_sharedlibrary.so lib/libomx_amrenc_sharedlibrary.so lib/libomx_avcdec_sharedlibrary.so lib/libomx_avcenc_sharedlibrary.so lib/libomx_imapdec_sharedlibrary.so lib/libomx_m4vdec_sharedlibrary.so lib/libomx_m4venc_sharedlibrary.so lib/libomx_mp3dec_sharedlibrary.so lib/libomx_radec_sharedlibrary.so lib/libomx_sharedlibrary.so lib/libomx_wmadec_sharedlibrary.so lib/libparser.so lib/libswscale.so lib/libwmapro.so lib/libx170j.so lib/hw/overlay.default.so etc/pvplayer.cfg | tar -C "$P/multimedia/system" -xf -
tar -C "$TMPROOT" -cf - lib/libopencore_author.so lib/libopencore_common.so lib/libopencore_download.so lib/libopencore_downloadreg.so lib/libopencore_flvlocal.so lib/libopencore_flvlocalreg.so lib/libopencore_mp4local.so lib/libopencore_mp4localreg.so lib/libopencore_net_support.so lib/libopencore_player.so lib/libopencore_rtsp.so lib/libopencore_rtspreg.so lib/libopencorehw.so | tar -C "$P/multimedia/system" -xf -

# opengl
mkdir -p "$P/opengl/system"
tar -C "$TMPROOT" -cf - lib/modules/galcore.ko lib/libGAL.so lib/libGLESv1_CM.so lib/libGLESv2.so lib/libGLESv2SC.so lib/egl/libEGL_VIVANTE.so lib/egl/libGLES_android.so lib/egl/libGLESv1_CM_VIVANTE.so lib/egl/libGLESv2_VIVANTE.so lib/egl/egl.cfg bin/busybox bin/inshal | tar -C "$P/opengl/system" -xf -

# sensors
mkdir -p "$P/sensors/system"
tar -C "$TMPROOT" -cf - lib/hw/sensors.default.so | tar -C "$P/sensors/system" -xf -

# sound
mkdir -p "$P/sound/system"
tar -C "$TMPROOT" -cf - lib/hw/alsa.default.so lib/libasound.so lib/libaudio.so | tar -C "$P/sound/system" -xf -

# wifi
mkdir -p "$P/wifi/system"
tar -C "$TMPROOT" -cf - etc/firmware/rt2870.bin etc/Wireless/RT2870STA/RT2870STA.dat lib/modules/rt2070sta.ko | tar -C "$P/wifi/system" -xf -

# misc
mkdir -p "$P/misc/system"
tar -C "$TMPROOT" -cf - lib/hw/hwcursor.default.so | tar -C "$P/misc/system" -xf -

echo "All done."
