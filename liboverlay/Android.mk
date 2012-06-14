# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)
# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.product.board>.so

include $(CLEAR_VARS)
ifeq ($(TARGET_PRODUCT), droid2)
LOCAL_CFLAGS += -DCONFIG_OMAP3530
endif
ifeq ($(TARGET_PRODUCT), droid2we)
LOCAL_CFLAGS += -DCONFIG_OMAP3530
endif
ifeq ($(TARGET_PRODUCT), shadow)
LOCAL_CFLAGS += -DCONFIG_OMAP3530
endif
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils

ifdef OMAP_ENHANCEMENT
LOCAL_SRC_FILES := overlay_ex.cpp
else
LOCAL_SRC_FILES := overlay.cpp
endif
LOCAL_SRC_FILES += v4l2_utils.c

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := overlay.omap3
include $(BUILD_SHARED_LIBRARY)
