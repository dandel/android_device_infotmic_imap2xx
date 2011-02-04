# config.mk
#
# Product-specific compile-time definitions.
#
TARGET_BOARD_PLATFORM := imap210

TARGET_CPU_ABI := armeabi-v6
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1136jf-s
TARGET_ARCH_VARIANT_FPU := vfp

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_CSR := false

# console=ttySAC3,115200 androidboot.mode=normal bmagic=0xdb6db610
#BOARD_KERNEL_CMDLINE := console=ttySAC0 androidboot.hardware=tcc92xx
#BOARD_KERNEL_CMDLINE := console=ttySAC3,115200 androidboot.mode=normal bmagic=0xdb6db610
BOARD_KERNEL_CMDLINE	:= console=ttySAC3,115200 androidboot.mode=normal mem=192M
BOARD_KERNEL_BASE		:= 0x40000000
#BOARD_FORCE_RAMDISK_ADDRESS     := 0x41000000
BOARD_PAGE_SIZE			:= 0x00001000


# fix 1: Examine /proc/mtd on a running device
# dev:    size   erasesize  name
# mtd0: 00600000 00080000 "kernel"
# mtd1: 00200000 00080000 "ramdisk"
# mtd2: 00200000 00080000 "recovery"
# mtd6: 1ff00000 00080000 "local"
# mtd7: 00100000 00080000 "panic"
# mtd8: 08000000 00080000 "resv"
#
#
# Fix 2: Examine the kernel boot log on a running device. See sample segment below.
# 
# <5>[    2.180000] Creating 9 MTD partitions on "NAND 2GiB 3,3V 8-bit":
# <5>[    2.185000] 0x000001a00000-0x000002000000 : "kernel"
# <5>[    2.195000] 0x000001800000-0x000001a00000 : "ramdisk"
# <5>[    2.200000] 0x000000500000-0x000000700000 : "recovery"
# <5>[    2.210000] 0x000012800000-0x00001e800000 : "system"
# <5>[    2.215000] 0x00001e800000-0x00005c000000 : "userdata"
# <5>[    2.225000] 0x00005c000000-0x000060000000 : "cache"
# <5>[    2.230000] 0x000060000000-0x00007ff00000 : "local"
# <5>[    2.240000] 0x00007ff00000-0x000080000000 : "panic"
# <5>[    2.245000] 0x000002800000-0x00000a800000 : "resv"

BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00200000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00200000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0C000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x3D800000
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_NAND_PAGE_SIZE := 4096

#define Various Configuration Options.

#define Cache Partition Details.
#BOARD_CACHE_DEVICE                 := /dev/block/mtdblock4
BOARD_CACHE_FILESYSTEM             := yaffs2
#define Data Partition Details.
#BOARD_DATA_DEVICE                  := /dev/block/mmcblk3p2
BOARD_DATA_FILESYSTEM              := yaffs2

#define Data Partition Details.
#BOARD_SYSTEM_DEVICE                  := /dev/block/mmcblk3p2
BOARD_SYSTEM_FILESYSTEM            := yaffs2

# Setting this to avoid boot locks on the system from using the "misc" partition.
BOARD_HAS_NO_MISC_PARTITION := true
# This device does not have an Internal SD Card
BOARD_HAS_SDCARD_INTERNAL: false
# external SD Card.
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk2p2
#BOARD_SDEXT_FILESYSTEM


# add cursor macro to enable/disable hardware cursor
HAVE_CURSOR := true

#USE_CAMERA_STUB := false
USE_CAMERA_STUB := true
#BOARD_CAMERA_LIBRARIES := libcamera
BOARD_GPS_LIBRARIES := libigps

WPA_BUILD_SUPPLICANT := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

BOARD_HAVE_MODEM := false
BOARD_MODEM_VENDOR := Infotmic
BOARD_MODEM_ID := EM770M
BOARD_MODEM_HAVE_DATA_DEVICE := true

BOARD_USE_HIGH_RESOLUTION := true

BOARD_USES_TSLIB := true

BOARD_USES_GSENSOR :=G10
