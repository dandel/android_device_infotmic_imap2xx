# config.mk
#
# Product-specific compile-time definitions.
#
TARGET_BOARD_PLATFORM := imap210

TARGET_ARCH_VARIANT := armv6

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_CPU_ABI := armeabi
#HAVE_HTC_AUDIO_DRIVER := true
#BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_HAVE_BLUETOOTH := true
HAVE_BLUETOOTH := true

# add cursor macro to enable/disable hardware cursor
HAVE_CURSOR := true

USE_CAMERA_STUB := false 
BOARD_CAMERA_LIBRARIES := libcamera
BOARD_GPS_LIBRARIES := libigps

WPA_BUILD_SUPPLICANT := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

BOARD_HAVE_MODEM := false
BOARD_MODEM_VENDOR := HUAWEI
BOARD_MODEM_ID := EM770M
BOARD_MODEM_HAVE_DATA_DEVICE := true

BOARD_USE_HIGH_RESOLUTION := true

BOARD_USES_GSENSOR :=G10
