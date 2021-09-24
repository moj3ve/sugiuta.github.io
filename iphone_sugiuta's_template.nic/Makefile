THEOS_DEVICE_IP = 192.168.3.21

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Prefs

include $(THEOS_MAKE_PATH)/aggregate.mk

after-stage::
	install.exec "killall -9 SpringBoard"
