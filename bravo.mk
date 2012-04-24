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

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.prl.recognition=1

# This is a high density device with more memory, so larger vm heaps for it.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

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
    libaudioutils
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
    hwcomposer.qsd8k
#    libgenlock \
#    libmemalloc \
#    liboverlay \
#    libtilerenderer \
#    libQcomUI
# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    libOmxVidEnc \
    libstagefrighthw

PRODUCT_PACKAGES += \
    librs_jni \
    bravo-keypad.kcm \


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab \
    device/htc/bravo/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf \
    device/htc/bravo/kernel:kernel \
    device/htc/bravo/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/bravo/camera.qsd8k.so:system/lib/hw/camera.qsd8k.so
