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

# add cursor macro to enable/disable hardware cursor
HAVE_CURSOR := true

# Modify system build properties
# media.stagefright.enable-player:
#   use opencore instead of stagefright, this enabled hw video decoding
# debug.sf.hw:
#   Use hardware accelerated GUI (seems to have no effect)
# opencore.asmd:
#   Enable hardware video decoding (seems to have no effect)
# log.redirect-stdio: If true, get stdout/err in logcat, for debugging
PRODUCT_PROPERTY_OVERRIDES += \
  media.stagefright.enable-player=false \
	debug.sf.hw=1 \
	opencore.asmd=1 \
	log.redirect-stdio=false

# 
# Copy common proprietary data
#

PRODIR := device/infotm/Imapx2x0/proprietary

# Infotmic Media Extensions.
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/multimedia/system,system)

# Infotmic OpenGL ES Support.
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/opengl/system,system)

# Audio Support. Files taken from zt-180 froyo firmware dated 2012-12-??
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(PRODIR)/sound/system,system)
