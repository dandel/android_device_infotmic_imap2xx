#
# All the blobs necessary for Infotmic OpenGL ES Support.
#

#
# Vivante OpenGL ES Libraries.
#

PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/opengl_es/egl/libEGL_VIVANTE.so:/system/lib/egl/libEGL_VIVANTE.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/libGAL.so:/system/lib/libGAL.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/libGLESv1_CM.so:/system/lib/libGLESv1_CM.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/libGLESv2.so:/system/lib/libGLESv2.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/libGLESv2SC.so:/system/lib/libGLESv2SC.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/egl/libGLES_android.so:/system/lib/egl/libGLES_android.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/egl/libGLESv1_CM_VIVANTE.so:/system/lib/egl/libGLESv1_CM_VIVANTE.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/egl/libGLESv2_VIVANTE.so:/system/lib/egl/libGLESv2_VIVANTE.so\
	device/infotm/Imapx2x0/proprietary/opengl_es/egl/egl.cfg:/system/lib/egl/egl.cfg


#
# Modules.
#

PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/opengl_es/modules/permfd.ko:/system/lib/modules/permfd.ko\
	device/infotm/Imapx2x0/proprietary/opengl_es/modules/galcore.ko:/system/lib/modules/galcore.ko

#
# Commands (Required to install Module)
#
PRODUCT_COPY_FILES += \
	device/infotm/Imapx2x0/proprietary/opengl_es/inshal:/system/bin/inshal\
	device/infotm/Imapx2x0/proprietary/opengl_es/busybox:/system/bin/busybox

