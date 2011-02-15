#
# All the blobs necessary for Infotmic Multimedia.
#

#
# libopencore AMR libraries.
#
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_flvlocalreg.so:/system/lib/libopencore_flvlocalreg.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_downloadreg.so:/system/lib/libopencore_downloadreg.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_download.so:/system/lib/libopencore_download.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_rtspreg.so:/system/lib/libopencore_rtspreg.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_common.so:/system/lib/libopencore_common.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_net_support.so:/system/lib/libopencore_net_support.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_mp4localreg.so:/system/lib/libopencore_mp4localreg.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_flvlocal.so:/system/lib/libopencore_flvlocal.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_player.so:/system/lib/libopencore_player.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencorehw.so:/system/lib/libopencorehw.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_mp4local.so:/system/lib/libopencore_mp4local.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_author.so:/system/lib/libopencore_author.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libopencore_rtsp.so:/system/lib/libopencore_rtsp.so

#device/infotm/Imapx2x0/P
#Libomx -- Multimedia extensions.
#

PRODUCT_COPY_FILESB += \
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_sharedlibrary.so:/system/lib/libomx_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_mp3dec_sharedlibrary.so:/system/lib/libomx_mp3dec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_m4vdec_sharedlibrary.so:/system/lib/libomx_m4vdec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_amrdec_sharedlibrary.so:/system/lib/libomx_amrdec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_avcdec_sharedlibrary.so:/system/lib/libomx_avcdec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_radec_sharedlibrary.so:/system/lib/libomx_radec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_aacdec_sharedlibrary.so:/system/lib/libomx_aacdec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_wmadec_sharedlibrary.so:/system/lib/libomx_wmadec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_imapdec_sharedlibrary.so:/system/lib/libomx_imapdec_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_amrenc_sharedlibrary.so:/system/lib/libomx_amrenc_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_m4venc_sharedlibrary.so:/system/lib/libomx_m4venc_sharedlibrary.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libomx_avcenc_sharedlibrary.so:/system/lib/libomx_avcenc_sharedlibrary.so


#
#x170 series of libraries
#
PRODUCT_COPY_FILESB += \
	device/infotm/Imapx2x0/proprietary/multimedia/libx170j.so:/system/lib/libx170j.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170h.so:/system/lib/libdecx170h.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170m.so:/system/lib/libdecx170m.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170m2.so:/system/lib/libdecx170m2.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170p.so:/system/lib/libdecx170p.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170rv.so:/system/lib/libdecx170rv.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdecx170v.so:/system/lib/libdecx170v.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libdwlx170.so:/system/lib/libdwlx170.so\

#
# FFMPEG.
#
PRODUCT_COPY_FILESB += \
	device/infotm/Imapx2x0/proprietary/multimedia/libavcodec.so:/system/lib/libavcodec.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libavutil.so:/system/lib/libavutil.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libswscale.so:/system/lib/libswscale.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libavformat.so:/system/lib/libavformat.so\

#
# Misc Libraries, Unidentified.
#

PRODUCT_COPY_FILESB += \
	device/infotm/Imapx2x0/proprietary/multimedia/libhwdecinterface.so:/system/lib/libhwdecinterface.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libparser.so:/system/lib/libparser.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libmm_dma.so:/system/lib/libmm_dma.so\
	device/infotm/Imapx2x0/proprietary/multimedia/lib7280enc.so:/system/lib/lib7280enc.so\
	device/infotm/Imapx2x0/proprietary/multimedia/libwmapro.so:/system/lib/libwmapro.so

# Configuration.
PRODUCT_COPY_FILESB += \
	device/infotm/Imapx2x0/proprietary/multimedia/etc/pvplayer.cfg:/system/lib/etc/pvplayer.cfg\
	device/infotm/Imapx2x0/proprietary/multimedia/overlay.default.so:/system/lib/overlay.default.so\

