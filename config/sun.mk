# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Include Online Updatable configs
$(call inherit-product, vendor/configs/online_updatable.mk)

# Include GMS, Modules and Pixel features
$(call inherit-product, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_s.mk)
$(call inherit-product, vendor/google/pixel/config.mk)

# Don't dexpreopt prebuilts. (For GMS).
DONT_DEXPREOPT_PREBUILTS := true

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

ifeq ($(SUN_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/common/etc/init/init.sun-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.sun-updater.rc
endif

# FaceUnlock
ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Launcher
PRODUCT_PACKAGES += \
    Launcher3QuickStep

# Preinstalled Packages
PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/config/preinstalled-packages-sun.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-sun.xml

# Permissions
PRODUCT_COPY_FILES += \
    vendor/sun/prebuilt/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/sun/prebuilt/config/permissions/privapp-permissions-settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-settings.xml \
    vendor/sun/prebuilt/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# Pop-Up View
PRODUCT_SYSTEM_PROPERTIES += \
    ro.sun.feature.pop_up_view=true

# System Tool
PRODUCT_PACKAGES += \
    SystemTool

# Theme Picker
PRODUCT_PACKAGES += \
    ParanoidThemePicker

# Online configs
PRODUCT_COPY_FILES += \
     vendor/sun/prebuilt/common/etc/init/init.sun-configs.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.sun-configs.rc

# Include Private keys
ifeq ($(SUN_BUILD_TYPE),Official)
  ifneq ("$(wildcard vendor/sun-priv/keys/keys.mk)","")
    include vendor/sun-priv/keys/keys.mk
  else
    $(warning :Missing private keys file (vendor/sun-priv/keys/keys.mk). Ensure keys are properly set up for official build.)
  endif
else
  -include vendor/sun-priv/keys/keys.mk
endif
