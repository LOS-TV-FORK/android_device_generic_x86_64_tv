# Graphics HAL — one universal gralloc4 backend that matches what init.sh
# actually programs at boot (HWC3/composer3 requires gralloc4, mapper@4.0):
#   init.sh auto/default+virtio sets ro.hardware.gralloc=minigbm_gbm_mesa
#   and debug.ui.default_mapper=4, so the mapper impl MUST be the gbm_mesa
#   one (DRV_EXTERNAL via libgbm/mesa), not minigbm (DRV_I915|DRV_AMDGPU)
#   whose HIDL_FETCH_IMapper returns NULL on that property -> hwc3-service.drm
#   aborts with "gralloc-mapper is missing" on every boot (QEMU AND real hw).
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.mapper@4.0-impl.minigbm_gbm_mesa \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@4.0-service.minigbm_gbm_mesa

# HWComposer HAL — HWC3 (drm_hwcomposer, нативный для LOS23); единственный.
# clone@2.1 / 2.4 / hwc3.drm / drmfb-легаси НЕ добавляем: все четверо (плюс drmfb)
# заявляют инстанцию IComposer и дают VINTF-конфликт + краш vendor.hwcomposer-3 в QEMU.
PRODUCT_PACKAGES += \
    android.hardware.composer.hwc3-service.drm

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.default \
    android.hardware.bluetooth.audio-impl

# Media codec
# Software codecs always present.
PRODUCT_PACKAGES += \
    android.hardware.media.c2-ffmpeg-service

# DumpState HAL
PRODUCT_PACKAGES += \
    com.android.hardware.dumpstate

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

# Keymint HAL
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service

#
# Non-secure implementation of AuthGraph HAL for compliance.
#
PRODUCT_PACKAGES += \
    com.android.hardware.security.authgraph

#
# Non-secure implementation of Secretkeeper HAL for compliance.
#
PRODUCT_PACKAGES += \
    com.android.hardware.security.secretkeeper

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light-service.x86

# Memtrack HAL
PRODUCT_PACKAGES += \
    com.android.hardware.memtrack

# Power HAL
PRODUCT_PACKAGES += \
    power.x86 \
    android.hardware.power-service.example

# Sensors HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb-service.example

# Drm HAL
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# GPS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.intel

# Bootctrl HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-x86impl \
    android.hardware.boot@1.2-x86impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_SOONG_NAMESPACES += \
    hardware/google/camera \
    hardware/google/camera/devices/EmulatedCamera \

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7-service-google \
    libgooglecamerahwl_impl

PRODUCT_COPY_FILES += \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_back.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_back.json \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_front.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_front.json \
    hardware/google/camera/devices/EmulatedCamera/hwl/configs/emu_camera_depth.json:$(TARGET_COPY_OUT_VENDOR)/etc/config/emu_camera_depth.json

# HIDL Allocator
PRODUCT_PACKAGES += android.hidl.allocator@1.0-service

# vndservice & vndservicemanager & hwservicemanager
PRODUCT_PACKAGES += vndservice vndservicemanager hwservicemanager
