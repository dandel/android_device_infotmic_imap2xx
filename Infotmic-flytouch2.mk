# load generic board config first
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-Board-generic.mk)

#
# Flytouch 2 / SuperPad / HypePad hardware addons
#
BOARD_HAVE_MODEM := false
BOARD_MODEM_VENDOR := HUAWEI
BOARD_MODEM_ID := EM770M
BOARD_MODEM_HAVE_DATA_DEVICE := true

BOARD_USE_HIGH_RESOLUTION := true

BOARD_HAVE_BLUETOOTH := true
HAVE_BLUETOOTH := true

BOARD_GPS_LIBRARIES := libigps

WPA_BUILD_SUPPLICANT := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

BOARD_USES_GSENSOR :=G10

# TODO: Just copying the proprietary libcamera doesn't work (linking errors)
#       For now, stick with the dummy implementation.
USE_CAMERA_STUB := false 
BOARD_CAMERA_LIBRARIES := libcamera

# Set flytouch2-specific properties
#
# swap_accel:
#   This will switch the g-sensor's x/y, otherwise the rotation is off
#   by 90 degrees.
PRODUCT_PROPERTY_OVERRIDES += \
  wifi.interface=ra0 \
  debug.sensors.swap_accel=-y,x,z \
	dalvik.vm.heapsize=32m

# 
# Copy flytouch2-specific proprietary data
#

PRODIR := device/infotm/Imapx2x0/proprietary

# Wireless Support.
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/wifi/system,system)

# GPS Support.
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/gps/system,system)

# Also copy to build object dir so libhwardware_legacy.so will link.
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/gps/system/lib/libigps.so:obj/lib/libigps.so

# Sensors support.
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/sensors/system/lib/hw,system/lib/hw)
