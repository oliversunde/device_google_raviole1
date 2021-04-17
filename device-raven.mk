#
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_KERNEL_DIR := device/google/raviole-kernel

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-raven.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raven/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/raven/device-vendor-raven.mk)
$(call inherit-product-if-exists, vendor/google/camera/devices/raviole/raven/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/raven/overlay

include device/google/gs101/device-shipping-common.mk
include device/google/gs101/fingerprint/udfps.mk
include device/google/raviole/audio/raven/audio-tables.mk
include hardware/google/pixel/vibrator/cs40l25/device.mk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.support_kernel_idle_timer=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.enable_frame_rate_override=true

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.raven.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.raven.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.raven.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.raven.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.raven.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
	device/google/raviole/thermal_info_config_raven.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Camera
PRODUCT_COPY_FILES += \
	device/google/raviole/media_profiles_raven.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Display Config
PRODUCT_COPY_FILES += \
	device/google/raviole/raven/display_golden_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_golden_cal0.pb

# NFC
PRODUCT_COPY_FILES += \
	device/google/raviole/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci-raven.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

DEVICE_MANIFEST_FILE += \
	device/google/gs101/nfc/manifest_se_gs101.xml

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vendor.vibrator.hal.long.frequency.shift=15

# Voice packs for Text-To-Speech
PRODUCT_COPY_FILES += \
	device/google/raviole/tts/ja-jp/ja-jp-x-htm-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-htm-r24.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-jaa-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-jaa-r24.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-jab-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-jab-r24.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-jac-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-jac-r24.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-jad-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-jad-r24.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-mfk-r24.zvoice:product/tts/google/ja-jp/ja-jp-x-mfk-r24.zvoice\
	device/google/raviole/tts/fr-fr/fr-fr-x-multi-r24.zvoice:product/tts/google/fr-fr/fr-fr-x-multi-r24.zvoice\
	device/google/raviole/tts/de-de/de-de-x-multi-r24.zvoice:product/tts/google/de-de/de-de-x-multi-r24.zvoice\
	device/google/raviole/tts/it-it/it-it-x-amb-r22.zvoice:product/tts/google/it-it/it-it-x-amb-r22.zvoice\
	device/google/raviole/tts/it-it/it-it-x-ita-r22.zvoice:product/tts/google/it-it/it-it-x-ita-r22.zvoice\
	device/google/raviole/tts/it-it/it-it-x-itb-r22.zvoice:product/tts/google/it-it/it-it-x-itb-r22.zvoice\
	device/google/raviole/tts/it-it/it-it-x-itc-r22.zvoice:product/tts/google/it-it/it-it-x-itc-r22.zvoice\
	device/google/raviole/tts/it-it/it-it-x-itd-r22.zvoice:product/tts/google/it-it/it-it-x-itd-r22.zvoice\
	device/google/raviole/tts/it-it/it-it-x-kda-r22.zvoice:product/tts/google/it-it/it-it-x-kda-r22.zvoice\
	device/google/raviole/tts/es-es/es-es-x-ana-r23.zvoice:product/tts/google/es-es/es-es-x-ana-r23.zvoice\
	device/google/raviole/tts/es-es/es-es-x-multi-r23.zvoice:product/tts/google/es-es/es-es-x-multi-r23.zvoice

# Display LBE
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.lbe.supported=1

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += device/google/raviole/powerstats/raven

# userdebug specific
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_COPY_FILES += \
        device/google/gs101/init.hardware.wlc.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_PLATFORM).wlc.rc
endif
