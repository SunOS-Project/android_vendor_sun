# Inherit mobile mini common Sun stuff
$(call inherit-product, vendor/sun/config/common_mobile_mini.mk)

# Inherit tablet common Sun stuff
$(call inherit-product, vendor/sun/config/tablet.mk)

$(call inherit-product, vendor/sun/config/telephony.mk)
