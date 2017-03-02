# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# AAPT
PRODUCT_AAPT_CONFIG := xhdpi hdpi normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Bluetooth
PRODUCT_PACKAGES += \
    	bt_vendor.conf \
    	libbt-vendor \

# Dalvik
PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# File System
PRODUCT_PACKAGES += \
    	make_ext4fs \
    	setup_fs

# Graphics
PRODUCT_PACKAGES += \
	iontest \
	ion-unit-tests \
	libGLES_android \
	libion.huawei \
	libion

PRODUCT_PROPERTY_OVERRIDES += \
    	debug.hwui.render_dirty_regions=false \
    	persist.sys.strictmode.disable=1 \
    	persist.sys.use_dithering=2 \
    	ro.opengles.version=131072 \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
	$(LOCAL_PATH)/rootdir/system/lib/egl/libGLES_mali.so:system/lib/egl/libGLES_mali.so \
	$(LOCAL_PATH)/rootdir/system/lib/hw/gralloc.hi6210sft.so:system/lib/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/rootdir/system/lib/libion.so:system/lib/libion.so \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/lib64/egl/libGLES_android.so:system/lib64/egl/libGLES_android.so \
	$(LOCAL_PATH)/rootdir/system/lib64/egl/libGLES_mali.so:system/lib64/egl/libGLES_mali.so \
	$(LOCAL_PATH)/rootdir/system/lib64/hw/gralloc.hi6210sft.so:system/lib64/hw/gralloc.hi6210sft.so \
	$(LOCAL_PATH)/rootdir/system/lib64/libion.so:system/lib64/libion.so \

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/hisi/hi6210sft/Image
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    	$(LOCAL_KERNEL):kernel

# Misc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	qemu.hw.mainkeys=0

# NFC
PRODUCT_PACKAGES += \
    	com.android.nfc_extras \
    	libnfc-nci \
    	libnfc_nci_jni \
    	nfc_nci.pn54x.default \
    	NfcNci \
    	Tag 

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/etc/libnfc-brcm-alice.conf:system/etc/libnfc-brcm.conf \
	$(LOCAL_PATH)/rootdir/system/etc/libnfc-nxp-alice.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml \

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/lib64/hw/nfc_nci.pn54x.default.so:system/lib64/hw/nfc_nci.pn54x.default.so

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/vendor/firmware/bcm2079x_firmware.ncd:system/vendor/firmware/bcm2079x_firmware.ncd \
	$(LOCAL_PATH)/rootdir/system/vendor/firmware/bcm2079x_pre_firmware.ncd:system/vendor/firmware/bcm2079x_pre_firmware.ncd \

PRODUCT_COPY_FILES += \
    	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
    	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    	frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    	frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    	frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/fstab.hi6210sft:root/fstab.hi6210sft \
	$(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/rootdir/init.hi6210sft.rc:root/init.hi6210sft.rc \
	$(LOCAL_PATH)/rootdir/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc \
	$(LOCAL_PATH)/rootdir/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc \
