#
# GPS firmware.
#
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/gps/igps.bin:system/etc/firmware/gps/igps.bin \
	device/infotm/Imapx2x0/proprietary/gps/libigps.so:system/lib/libigps.so

# Also copy to build object dir so libhwardware_legacy.so will link.
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/gps/libigps.so:obj/lib/libigps.so
