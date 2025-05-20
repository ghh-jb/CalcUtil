TARGET := iphone:clang:14.5:14.5


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CalcUtil

CalcHaptics_FILES = Tweak.xm
CalcHaptics_CFLAGS = -fobjc-arc
CalcHaptics_FRAMEWORKS = AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
