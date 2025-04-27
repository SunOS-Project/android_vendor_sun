# Inherit mobile full common Sun stuff
$(call inherit-product, vendor/sun/config/common_mobile_full.mk)

# Inherit tablet common Sun stuff
$(call inherit-product, vendor/sun/config/tablet.mk)

$(call inherit-product, vendor/sun/config/telephony.mk)
