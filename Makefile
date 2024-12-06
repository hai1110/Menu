export THEOS=/Users/dothanh1110/theos
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
IGNORE_WARNINGS = 1
# THEOS_PACKAGE_SCHEME = rootless
TARGET = iphone:clang:latest:16.5

include $(THEOS)/makefiles/common.mk


TWEAK_NAME = ESP

SECURITY_SRC = $(wildcard Security/*.mm)
LOADVIEW_SRC = $(wildcard LoadView/*.mm) $(wildcard LoadView/*.m)
IMGUI_SRC = $(wildcard imgui/*.cpp) $(wildcard imgui/*.mm)

$(TWEAK_NAME)_CCFLAGS = -std=c++17 -fno-rtti -fno-exceptions -DNDEBUG -Wall -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-function -fvisibility=hidden -fexceptions

$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wall -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-function -fvisibility=hidden
$(TWEAK_NAME)_LDFLAGS = hok/libdaubuoi.a
$(TWEAK_NAME)_LDFLAGS+=
ifeq ($(IGNORE_WARNINGS),1)
  $(TWEAK_NAME)_CFLAGS += -w
  $(TWEAK_NAME)_CCFLAGS += -w
endif

$(TWEAK_NAME)_FILES = esp.mm $(SECURITY_SRC) $(LOADVIEW_SRC) $(IMGUI_SRC) $(wildcard LoadView/Support/*.m) $(wildcard SSZipArchive/minizip/*.c) $(wildcard SSZipArchive/*.m) $(wildcard mod/*.mm)
$(TWEAK_NAME)_FRAMEWORKS =  UIKit Foundation UniformTypeIdentifiers Security QuartzCore CoreGraphics CoreText  AVFoundation Accelerate GLKit SystemConfiguration GameController UIKit SafariServices Accelerate Foundation QuartzCore CoreGraphics AudioToolbox CoreText Metal MobileCoreServices Security SystemConfiguration IOKit CoreTelephony CoreImage CFNetwork AdSupport AVFoundation 
include $(THEOS_MAKE_PATH)/tweak.mk