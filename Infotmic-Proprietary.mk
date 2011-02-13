# Inherit Infotmic Media Extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-MediaExtensions.mk)
# Inherit Infotmic OpenGL ES. (Vivante)
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-OpenGLES.mk)
# Inherit Wifi extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-Wifi.mk)
# Include GPS.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-gps.mk)
# Sensors
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-sensors.mk)
