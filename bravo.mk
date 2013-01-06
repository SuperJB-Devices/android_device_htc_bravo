#
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

$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.prl.recognition=1

# This is a high density device with more memory, so larger vm heaps for it.
$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

# Sensors
PRODUCT_PACKAGES := \
    gps.bravo \
    lights.bravo \
    sensors.bravo \
    camera.qsd8k
    
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k \
    audio.usb.default \
    libaudioutils
    
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.qsd8k

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libstagefrighthw

PRODUCT_PACKAGES += \
    librs_jni \
    bravo-keypad.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Misc
PRODUCT_PACKAGES += \
    power.qsd8k \
    com.android.future.usb.accessory

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc
    
# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/bravo-keypad.kcm:system/usr/keychars/bravo-keypad.kcm \
    device/htc/bravo/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab \
    device/htc/bravo/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf \
    device/htc/bravo/sysctl.conf:system/etc/sysctl.conf \
    device/htc/bravo/10mountSDext:system/etc/init.d/10mountSDext \
    device/htc/bravo/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/bravo/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/bravo/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh
