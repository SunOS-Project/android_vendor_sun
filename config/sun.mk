ifeq ($(SUN_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/common/etc/init/init.sun-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.sun-updater.rc
endif
