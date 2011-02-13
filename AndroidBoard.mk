LOCAL_PATH := $(call my-dir)

# Install custom keymap
include $(CLEAR_VARS)
LOCAL_SRC_FILES := resources/tuttle2.kcm
include $(BUILD_KEY_CHAR_MAP)

# This will install the file in /system/etc
#

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.fstab
LOCAL_SRC_FILES := resources/etc/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# Override init.rc with our own version
TARGET_PROVIDES_INIT_RC := true
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/resources/init.rc:root/init.rc

# WiFi config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/resources/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Touchscreen calibration config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/resources/etc/ts.conf:system/etc/ts.conf
