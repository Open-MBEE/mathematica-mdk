#!/bin/bash

VERSION=3.4.2
DIST_ZIP="mathematica-mdk-${VERSION}.zip"

mkdir -p build/
cp MDK.wl build/

echo "Installing with mms-mathematica-client:${VERSION}"
echo "Downloading from https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-mathematica-client/${VERSION}/mms-mathematica-client-${VERSION}.zip"
curl -sL "https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-mathematica-client/${VERSION}/mms-mathematica-client-${VERSION}.zip" -o mms-mathematica-client.zip
unzip -q mms-mathematica-client.zip -d build/
rm mms-mathematica-client.zip


(cd build; zip -qr "../${DIST_ZIP}" . -x ".swagger-*" "LICENSE")
rm -rf build/

echo "Saving as ${DIST_ZIP}"