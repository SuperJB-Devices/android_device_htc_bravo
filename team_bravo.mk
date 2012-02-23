$(call inherit-product, vendor/SuperTeam/products/high_telephony_device.mk)

$(call inherit-product, vendor/SuperTeam/products/usbaccessory.mk)

$(call inherit-product, vendor/SuperTeam/products/flash.mk)

$(call inherit-product, vendor/SuperTeam/products/hdpi.mk)

$(call inherit-product, device/htc/bravo/bravo.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

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
    wifi.interface=eth0 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/bravo/overlay

PRODUCT_VERSION_MAINTENANCE := 9999