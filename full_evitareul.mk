$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/evitareul/evitareul-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/evitareul/overlay

LOCAL_PATH := device/htc/evitareulreul
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/evitareul/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/evitareul/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/evitareul/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/evitareul/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/evitareul/recovery/sbin/app_process:recovery/root/sbin/app_process \
    device/htc/evitareul/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_evitareul
PRODUCT_DEVICE := evitareul
