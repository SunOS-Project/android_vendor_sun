SUN_BUILD_TYPE ?= Unofficial

SUN_VERSION := varuna

SUN_DATE_YEAR := $(shell date -u +%Y)
SUN_DATE_MONTH := $(shell date -u +%m)
SUN_DATE_DAY := $(shell date -u +%d)
SUN_DATE_HOUR := $(shell date -u +%H)
SUN_DATE_MINUTE := $(shell date -u +%M)

SUN_BUILD_DATE_UTC := $(shell date -d '$(SUN_DATE_YEAR)-$(SUN_DATE_MONTH)-$(SUN_DATE_DAY) $(SUN_DATE_HOUR):$(SUN_DATE_MINUTE)' -u +%s)

# Display version
SUN_DISPLAY_VERSION := Sun-$(SUN_VERSION)-$(shell date +%Y%m%d)-$(SUN_BUILD)-$(SUN_BUILD_TYPE)

# Platform Display version
SUN_PLATFORM_DISPLAY_VERSION := $(SUN_VERSION)-$(shell date +%Y%m%d)-$(SUN_BUILD)-$(SUN_BUILD_TYPE)

# Sun version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sun.device=$(SUN_BUILD) \
    ro.sun.version=$(SUN_VERSION) \
    ro.sun.version.display=$(SUN_DISPLAY_VERSION) \
    ro.sun.platform.display.version=$(SUN_PLATFORM_DISPLAY_VERSION) \
    ro.sun.build_date_utc=$(SUN_BUILD_DATE_UTC)
