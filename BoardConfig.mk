# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/bravo/BoardConfigVendor.mk

TARGET_ARCH := arm

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := bravo

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

BOARD_EGL_CFG := device/htc/bravo/egl.cfg

USE_OPENGL_RENDERER := true
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DUNABLE_TO_DEQUEUE
COMMON_GLOBAL_CFLAGS += -DCOPYBIT_QSD8K -DQCOM_HARDWARE
# We only have 2 buffers
TARGET_DISABLE_TRIPLE_BUFFERING := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_NO_HW_VSYNC := true
COMMON_GLOBAL_CFLAGS += -DTARGET_8x50

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bionic optimizations
TARGET_USE_LINARO_STRING_ROUTINES := true

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"

BOARD_USES_GENERIC_AUDIO := false

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_LEGACY_QCOM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_LEGACY_TOUCHSCREEN := true

#BOARD_HAVE_FM_RADIO := true
#BOARD_FM_DEVICE := bcm4329
#BOARD_HAVE_QCOM_FM := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 000a0000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 0fa00000 00020000 "system"
# mtd4: 02800000 00020000 "cache"
# mtd5: 093a0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=  262144000 # 0x09100000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 154140672 # 0x093a0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# to enable the GPS HAL
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := bravo
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# FPU compilation flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

TARGET_SPECIFIC_HEADER_PATH := device/htc/bravo/include

# Hardware rendering

# qsd dont have overlay support in kernel
TARGET_USE_OVERLAY := false
# qsd dont have bypass
TARGET_HAVE_BYPASS := false

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_HC_RADIO := true 

# Misc
BOARD_USE_OPENSSL_ENGINE := true

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true
ENABLE_WEBGL := true

# Legacy ril
COMMON_GLOBAL_CFLAGS += -DRIL_VERSION_2_SUPPORT

# Camcorder
BOARD_USE_OLD_AVC_ENCODER := true
BOARD_NO_BFRAMES := true

# Override kernel toolchain. (4.6 is too unstable)
KERNEL_TOOLCHAIN_PREFIX:=$(ANDROID_BUILD_TOP)/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
TARGET_PREBUILT_KERNEL := device/htc/bravo/kernel
TARGET_KERNEL_CONFIG := superteam_bravo_defconfig
BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

PRODUCT_COPY_FILES += \
    device/htc/bravo/kernel:kernel

