#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 The TWRP Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/vince

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Board configuration
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := vince

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232BOARD_ROOT_EXTRA_FOLDERS := dsp firmware persist
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := \
	ignore_loglevel \
	console=ttyHSL0,115200,n8 \
	androidboot.console=ttyHSL0 \
	androidboot.hardware=qcom \
	 msm_rtb.filter=0x237 \
	 ehci-hcd.park=3 \
	 lpm_levels.sleep_disabled=1 \
	 androidboot.bootdevice=7824900.sdhci \
	 earlycon=msm_hsl_uart,0x78af000 \
	 audit=0 \
	 androidboot.selinux=permissive \
    androidboot.usbconfigfs=true loop.max_part=7 \
	 buildvariant=eng

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Kernel configuration
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/vince
TARGET_KERNEL_CONFIG := vince_defconfig

# Platform
TARGET_BOARD_PLATFORM := msm8953
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Hack: prevent anti rollback
PLATFORM_VERSION := 127
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Encryption
BOARD_USES_QCOM_DECRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_HW_DISK_ENCRYPTION := true

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TW_NEW_ION_HEAP := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_EDL_MODE := false
TW_INPUT_BLACKLIST := "hbtp_vm"

TARGET_RECOVERY_DEVICE_MODULES += \
    ashmemd \
    ashmemd_aidl_interface-cpp \
    libashmemd_client \
    libcap \
    libdrm \
    libicui18n \
    libion \
    libicuuc \
    libpcrecpp \
    libprocinfo \
    libxml2

TW_RECOVERY_ADDITIONAL_RELINK_BINARY_FILES += \
    $(TARGET_OUT_EXECUTABLES)/ashmemd

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrm.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libicui18n.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpcrecpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprocinfo.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so
