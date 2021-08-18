# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

ifeq ($(SUN_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/common/etc/init/init.sun-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.sun-updater.rc
endif

# Preinstalled Packages
PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/config/preinstalled-packages-sun.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-sun.xml
