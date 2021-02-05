#!/bin/bash
set -e

# shellcheck disable=SC1091
source scripts/setup-vars.sh "$2" "$3"

APP_NAME=$1
if [[ "$APP_NAME" == notion-enhanced ]]; then
  BUILD_DIR=$BUILD_DIR_ENHANCED
fi

check-command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo Missing command: "$1"
    exit 1
  fi
}

commands=(dpkg fakeroot)

# Check for required commands
for command in "${commands[@]}"; do
  check-command "$command"
done

# Create Debian package
if ! [ -f "out/debs/${APP_NAME}_$NOTION_VERSION-${PACKAGE_REVISION}_$PACKAGE_ARCH.deb" ]; then
  electron-installer-debian \
    --src "$BUILD_DIR/$APP_NAME-linux-$BUILD_ARCH" \
    --dest out/debs \
    --arch "$PACKAGE_ARCH" \
    --options.productName Notion \
    --options.icon "$BUILD_DIR/$APP_NAME-linux-$BUILD_ARCH/resources/app/icon.png" \
    --options.desktopTemplate templates/desktop-deb.ejs \
    --options.revision "$PACKAGE_REVISION"
fi
