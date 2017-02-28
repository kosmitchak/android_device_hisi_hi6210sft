LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), hi6210sft)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
