# Device
$(call inherit-product, device/hisi/hi6210sft/full_hi6210sft.mk)

PRODUCT_NAME := omni_hi6210sft
PRODUCT_DEVICE := hi6210sft
PRODUCT_BRAND := ALE-L21
PRODUCT_MODEL := OmniROM 6.0 Marshmallow on Huawei P8 Lite ALE-L21 Single Sim
PRODUCT_MANUFACTURER := HUAWEI

# OmniROM 6.0 Marshmallow
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)


