# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PROPERTY_OVERRIDES += \
    	hw.lcd.lcd_density=320 \
    	ro.sf.lcd_density=320 \

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

# Properties: add some override flags, same one used on stock Emui 4.0.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	debug.atrace.tags.enableflags=0 \
	ro.adb.secure=1 \
	ro.allow.mock.location=0 \
	ro.debuggable=0 \
	ro.magic.api.version=0.1 \
	ro.secure=1 \
	ro.zygote=zygote64_32 \
	security.perf_harden=1

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/fstab.hi6210sft:root/fstab.hi6210sft \
	$(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/rootdir/init.hi6210sft.rc:root/ \
	$(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
	$(LOCAL_PATH)/rootdir/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc \
	$(LOCAL_PATH)/rootdir/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc

# Zygote
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.zygote=zygote64_32

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc
