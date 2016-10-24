#!/bin/sh
set -e

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

case "${TARGETED_DEVICE_FAMILY}" in
  1,2)
    TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
    ;;
  1)
    TARGET_DEVICE_ARGS="--target-device iphone"
    ;;
  2)
    TARGET_DEVICE_ARGS="--target-device ipad"
    ;;
  *)
    TARGET_DEVICE_ARGS="--target-device mac"
    ;;
esac

realpath() {
  DIRECTORY="$(cd "${1%/*}" && pwd)"
  FILENAME="${1##*/}"
  echo "$DIRECTORY/$FILENAME"
}

install_resource()
{
  if [[ "$1" = /* ]] ; then
    RESOURCE_PATH="$1"
  else
    RESOURCE_PATH="${PODS_ROOT}/$1"
  fi
  if [[ ! -e "$RESOURCE_PATH" ]] ; then
    cat << EOM
error: Resource "$RESOURCE_PATH" not found. Run 'pod install' to update the copy resources script.
EOM
    exit 1
  fi
  case $RESOURCE_PATH in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}"
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.framework)
      echo "mkdir -p ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av $RESOURCE_PATH ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH"`.mom\""
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd\""
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm\""
      xcrun mapc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE=$(realpath "$RESOURCE_PATH")
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    *)
      echo "$RESOURCE_PATH"
      echo "$RESOURCE_PATH" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "KMCGeigerCounter/KMCGeigerCounter/KMCGeigerCounterTick.aiff"
  install_resource "ResearchKit/ResearchKit/Consent/MovieTintShader.fsh"
  install_resource "ResearchKit/ResearchKit/Consent/MovieTintShader.vsh"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_01@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_02@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_03@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_04@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_05@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_06@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_07@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_01@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_02@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_03@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_04@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_05@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_06@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_07@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Artwork.xcassets"
  install_resource "ResearchKit/ResearchKit/Localized/ar.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ca.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/cs.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/da.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/de.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/el.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en_AU.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en_GB.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/es.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/es_MX.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fr_CA.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/he.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hu.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/id.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/it.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ja.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ko.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ms.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/nl.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/no.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pl.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pt.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pt_PT.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ro.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ru.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/sk.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/sv.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/th.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/tr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/uk.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/vi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_CN.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_HK.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_TW.lproj"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "KMCGeigerCounter/KMCGeigerCounter/KMCGeigerCounterTick.aiff"
  install_resource "ResearchKit/ResearchKit/Consent/MovieTintShader.fsh"
  install_resource "ResearchKit/ResearchKit/Consent/MovieTintShader.vsh"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_01@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_02@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_03@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_04@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_05@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_06@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@2x/consent_07@2x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_01@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_02@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_03@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_04@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_05@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_06@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Animations/phone@3x/consent_07@3x.m4v"
  install_resource "ResearchKit/ResearchKit/Artwork.xcassets"
  install_resource "ResearchKit/ResearchKit/Localized/ar.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ca.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/cs.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/da.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/de.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/el.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en_AU.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/en_GB.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/es.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/es_MX.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/fr_CA.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/he.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/hu.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/id.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/it.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ja.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ko.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ms.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/nl.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/no.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pl.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pt.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/pt_PT.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ro.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/ru.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/sk.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/sv.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/th.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/tr.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/uk.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/vi.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_CN.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_HK.lproj"
  install_resource "ResearchKit/ResearchKit/Localized/zh_TW.lproj"
fi

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "$XCASSET_FILES" ]
then
  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "`realpath $PODS_ROOT`*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
