#
# Copyright (C) 2022-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from xiaomi sm8450-common
TARGET_HAS_UDFPS := true
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/unicorn/unicorn-vendor.mk)

# MiuiCamera
$(call inherit-product-if-exists, device/xiaomi/miuicamera-unicorn/device.mk)
$(call soong_config_set,camera,package_name,com.android.camera)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/resourcemanager_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Overlay
PRODUCT_PACKAGES += \
    ApertureResUnicorn \
    FrameworksResUnicorn \
    LineageResUnicorn \
    NfcResUnicorn \
    SettingsProviderResUnicorn \
    SettingsResUnicorn \
    SystemUIResUnicorn \
    WifiResUnicorn

# Powershare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

# SukiSU-Ultra SUSFS userspace tool. Root itself is built into the kernel;
# the manager app is NOT bundled — the kernel only crowns managers installed
# under /data/app, so users install the official APK themselves.
PRODUCT_PACKAGES += \
    ksu_susfs

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
