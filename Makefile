TARGET := iphone:clang:14.5:14.5


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CalcUtil

CalcUtil_FILES = Tweak.xm
CalcUtil_CFLAGS = -fobjc-arc
CalcUtil_FRAMEWORKS = AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
