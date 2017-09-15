LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

AAC_LIBRARY = fraunhofer

ifeq ($(AAC_LIBRARY), fraunhofer)

  include $(CLEAR_VARS)

  LOCAL_SRC_FILES := \
          SoftAACEncoder2.cpp

  LOCAL_C_INCLUDES := \
          frameworks/av/media/libstagefright/include \
          frameworks/native/include/media/openmax \
          external/aac/libAACenc/include \
          external/aac/libFDK/include \
          external/aac/libMpegTPEnc/include \
          external/aac/libSBRenc/include \
          external/aac/libSYS/include

  LOCAL_CFLAGS :=

  LOCAL_CFLAGS += -Werror
  LOCAL_CLANG := true
  LOCAL_SANITIZE := signed-integer-overflow unsigned-integer-overflow

  LOCAL_STATIC_LIBRARIES := libFraunhoferAAC

  LOCAL_SHARED_LIBRARIES := \
          libstagefright_omx libstagefright_foundation libutils liblog

  LOCAL_MODULE := libstagefright_soft_aacenc
  LOCAL_MODULE_TAGS := optional

  include $(BUILD_SHARED_LIBRARY)

endif # $(AAC_LIBRARY)
