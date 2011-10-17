BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

ST_KERNEL_DIR := kernel/bravo
ST_KERNEL_CFG := device/htc/bravo/superteam_bravo_defconfig
ST_KERNEL_IMG := device/htc/bravo/kernel

TARGET_CUSTOM_KERNEL := false
    
PRODUCT_COPY_FILES += \
	device/htc/bravo/kernel:kernel
