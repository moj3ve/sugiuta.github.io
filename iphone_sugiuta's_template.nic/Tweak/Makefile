ARCHS = arm64 arm64e

include @@THEOS@@/makefiles/common.mk

TWEAK_NAME = @@FULLPROJECTNAME@@
$(TWEAK_NAME)_FILES = Tweak.xm Classes/UIColor+Hex.m
ADDITIONAL_OBJCFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS += UIKit QuartzCore
$(TWEAK_NAME)_LIBRARIES = colorpicker Kuromi
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS += MediaRemote
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk