ST_KERNEL_DIR := kernel/bravo
ST_KERNEL_CFG := device/htc/bravo/superteam_bravo_defconfig
ST_KERNEL_IMG := device/htc/bravo/kernel

TARGET_CUSTOM_KERNEL := false
    
PRODUCT_COPY_FILES += \
	device/htc/bravo/kernel:kernel
