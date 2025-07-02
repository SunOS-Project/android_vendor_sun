PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += sunVarsPlugin

SOONG_CONFIG_sunVarsPlugin :=

define addVar
  SOONG_CONFIG_sunVarsPlugin += $(1)
  SOONG_CONFIG_sunVarsPlugin_$(1) := $($1)
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += sunQcomVars
# Only create display_headers_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_sunQcomVars += \
    uses_oplus_camera \
    uses_nothing_camera \
    supports_ltpo
endif

# Soong bool variables
SOONG_CONFIG_sunQcomVars_uses_oplus_camera := $(TARGET_USES_OPLUS_CAMERA)
SOONG_CONFIG_sunQcomVars_supports_ltpo := $(TARGET_SUPPORTS_LTPO)

# Soong value variables
SOONG_CONFIG_sunQcomVars_uses_nothing_camera := $(TARGET_USES_NOTHING_CAMERA)

# Camera
ifneq ($(TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED),)
    $(call soong_config_set,camera,override_format_from_reserved,$(TARGET_CAMERA_OVERRIDE_FORMAT_FROM_RESERVED))
endif

# Libui
ifneq ($(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS),)
    $(call soong_config_set,libui,additional_gralloc_10_usage_bits,$(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS))
endif

# Recovery
ifneq ($(BOOTLOADER_MESSAGE_OFFSET),)
    $(call soong_config_set,sun_recovery,bootloader_message_offset,$(BOOTLOADER_MESSAGE_OFFSET))
endif

# Surfaceflinger
ifneq ($(TARGET_SURFACEFLINGER_UDFPS_LIB),)
    $(call soong_config_set,surfaceflinger,udfps_lib,$(TARGET_SURFACEFLINGER_UDFPS_LIB))
endif

# Vendor init
ifneq ($(TARGET_INIT_VENDOR_LIB),)
    $(call soong_config_set,libinit,vendor_init_lib,$(TARGET_INIT_VENDOR_LIB))
endif
