#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Opengapps settings 
GAPPS_VARIANT := mini
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_MATCHING_DPI := false

PRODUCT_PACKAGE_OVERLAYS := \
	device/asus/nakasig/overlay-nakasig \
	device/asus/nakasig/overlay-nexus \

PRODUCT_PROPERTY_OVERRIDES := \
        ro.product.manufacturer=asus \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false \
	ro.com.android.mobiledata=false \
	net.bt.name=Nexus7 \
	ro.config.ringtone=Girtab.ogg \
	ro.config.notification_sound=Tejat.ogg \
	ro.config.alarm_alert=Cesium.ogg

# Nexus 7 has no gesture sensor
PRODUCT_PROPERTY_OVERRIDES += \
	gesture.disable_camera_launch=1

# override package for reduce system image
PRODUCT_PACKAGES := \
	EditorsDocsStub \
	EditorsSheetsStub \
	EditorsSlidesStub \
	NewsstandStub \
	HangoutsStub \
	PrebuiltKeepStub \
	BooksStub \
	CloudPrint2Stub \
	DriveStub \
	FitnessPrebuiltStub \
	MapsStub \
	PlusOneStub \
	TranslateStub \
	VideosStub \
	YouTubeStub

PRODUCT_PACKAGES += \
	FakeNexusProvision \
	PartnerBookmarksProvider \
	CellBroadcastReceiver \
	NakasigLayout

PRODUCT_PACKAGES += \
	Stk \
	NfcProvision

# Include additional opengapps package not included in selected variant
PRODUCT_PACKAGES += \
	GCS \

PRODUCT_COPY_FILES := \
	device/asus/nakasig/init.nakasig.rc:root/init.nakasig.rc

$(call inherit-product, vendor/google/build/bootanimation/bootanimation.mk)
$(call inherit-product, vendor/google/build/opengapps-packages.mk)
$(call inherit-product, device/asus/tilapia/full_tilapia.mk)


ifeq ($(TARGET_BUILD_VARIANT),user)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

# reduce system image size
PRODUCT_AAPT_CONFIG := normal
PRODUCT_LOCALES := en_US en_GB fr_FR zh-rTW

#PRODUCT_DEFAULT_DEV_CERTIFICATE := device/asus/nakasig/security/releasekey

PRODUCT_NAME := nakasig
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 7

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.product.name=$(PRODUCT_NAME) \
