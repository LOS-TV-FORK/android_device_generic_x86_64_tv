#
# Copyright (C) 2011-2017 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

PRODUCT_PACKAGES := \
    hwcomposer.drm hwcomposer.drm_minigbm hwcomposer.drm_celadon hwcomposer.drm_minigbm_celadon \
    hwcomposer.drm_gbm_cros hwcomposer.drm_gbm_cros_celadon \
    gralloc.minigbm_dmabuf gralloc.minigbm gralloc.minigbm_arcvm gralloc.minigbm_gbm_mesa gralloc.minigbm_nouveau \
    gralloc.gbm gralloc.gbm_hack gralloc.gbm_noscanout \
    libtxc_dxtn     \
    modetest \
    vulkan.intel \
    vulkan.intel_hasvk \
    vulkan.radeon \
    vulkan.virtio \
    vulkan.nouveau \
    vulkan.lvp \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle \
    vulkan.pastel

PRODUCT_PACKAGES += \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libgbm_mesa_wrapper \
    dri_gbm \
    crocus_drv_video \
    amdgpu.ids

# VA-API stack used by our own hardware video decoder (vendor/intel/va_decoder,
# "vadec"). This replaces Intel MediaSDK, which was never part of stock and was
# removed; the decoder talks to iHD_drv_video.so through libva directly.
#
# All three must be installed together: iHD_drv_video.so links against
# libigdgmm_android.so (gmmlib) and is dlopen()ed by libva. If any one of them
# is missing, vaInitialize() fails and the decoder cannot open the driver at
# all - the driver advertises its VA-API version only as __vaDriverInit_1_23,
# which is what the bundled libva (VA_MINOR_VERSION 23) looks for.
PRODUCT_PACKAGES += \
    libva \
    libigdgmm_android \
    iHD_drv_video

PRODUCT_VENDOR_PROPERTIES += \
    debug.angle.feature_overrides_enabled=preferLinearFilterForYUV

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

