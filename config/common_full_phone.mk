# Inherit mobile full common Sun stuff
$(call inherit-product, vendor/sun/config/common_mobile_full.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/sun/config/telephony.mk)
