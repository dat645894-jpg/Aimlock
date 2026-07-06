TARGET = iphone:clang:latest:15.8
INSTALL_TARGET_PROCESSES = FreeFire
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = AimlockOB54
AimlockOB54_FILES = AimLock.m
include $(THEOS)/makefiles/tweak.mk
