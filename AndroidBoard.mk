LOCAL_PATH := $(call my-dir)

# Install custom keymap
include $(CLEAR_VARS)
LOCAL_SRC_FILES := prebuilt/tuttle2.kcm
include $(BUILD_KEY_CHAR_MAP)
