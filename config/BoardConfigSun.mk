# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

include vendor/sun/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include device/qcom/common/BoardConfigQcom.mk
endif

include vendor/sun/config/BoardConfigSoong.mk
