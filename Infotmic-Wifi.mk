#
# RT2870 firmware.
#
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/wifi/etc/firmware/rt73.bin:/system/etc/firmware/rt73.bin\
	device/infotm/Imapx2x0/proprietary/wifi/etc/firmware/rt2870.bin:/system/etc/firmware/rt2870.bin

#
# RT2870 dat file.
#

PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/wifi/etc/Wireless/RT2870STA/RT2870STA.dat:/system/etc/Wireless/RT2870STA/RT2870STA.dat

#
# RT2870 Modules.
#
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/wifi/modules/rt2070sta.ko:/system/lib/modules/rt2070sta.ko\
	device/infotm/Imapx2x0/proprietary/wifi/modules/rt3070sta.ko:/system/lib/modules/rt3070sta.ko

