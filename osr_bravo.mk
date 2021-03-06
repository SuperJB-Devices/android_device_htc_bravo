TEAM_PRODUCT := bravo
TINY_GAAPS := True

# Inherit some common OSR stuff.
$(call inherit-product, vendor/osr/config/medium_phone.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, device/htc/bravo/bravo.mk)

$(call inherit-product, device/htc/bravo/kernel.mk)

$(call inherit-product, vendor/osr/config/themes_common.mk)

$(call inherit-product, vendor/osr/config/livewallpapers.mk)

$(call inherit-product, vendor/osr/config/flash.mk)

# Setup device specific product configuration.
PRODUCT_NAME := osr_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=eng BUILD_VERSION_TAGS=release-keys

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    video.accelerate.hw=1 \
    debug.performance.tuning=1 \
    ro.max.fling_velocity=12000 \
    ro.min.fling_velocity=8000 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
	persist.service.adb.enable=1
    
# Hardware Rendering Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=2 \
    hwui.disable_vsync=true

# Properties for jb
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=120 \
    ro.opengles.version=131072 \
    ro.telephony.default_network=3 \
    ro.ril.enable.prl.recognition=1 \
    ro.telephony.ril.v3=signalstrength,singlepdp \
    ro.vold.umsdirtyratio=20
    
# Personal properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.dec.jpeg.memcap=20000000 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45
	
# Dalvik Properties
# dexop-flags: "v=" n|r|a, "o=" n|v|a|f, "m=y" register map
# v=verify o=optimize: n=none r=remote a=all f=full v=verified
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false
    
# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Camera (video recording)
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1 \
    rw.media.record.hasb=0

# Qcom
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=1 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

DEVICE_PACKAGE_OVERLAYS += device/htc/bravo/overlay

VENDOR_WIPE_USER_DATA := true
VENDOR_COPY_USER_DATA := true

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

#Skip test
LIBCORE_SKIP_TESTS := true
BLUEZ_SKIP_TESTS := true
SKIA_SKIP_TESTS := true

PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

