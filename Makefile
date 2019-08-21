ARCHS = arm64 arm64e
FOR_RELEASE=1
THEOS_DEVICE_IP=192.168.1.12
include theos/makefiles/common.mk


TWEAK_NAME = PandoraPro
PandoraPro_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	