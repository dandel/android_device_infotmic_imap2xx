LOCAL_PATH := $(call my-dir)/prebuilt

# Install custom keymap
include $(CLEAR_VARS)
LOCAL_SRC_FILES := tuttle2.kcm
include $(BUILD_KEY_CHAR_MAP)
