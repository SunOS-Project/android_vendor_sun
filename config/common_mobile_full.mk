# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mobile.mk)

PRODUCT_SIZE := full

PRODUCT_PACKAGES += \
    Aperture

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd
