#!/bin/bash

client_version=3.4.2

mkdir -p build/
cp MDK.wl build/

echo "Installing with MMS Mathematica Client version $client_version"
echo "Downloading from https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-mathematica-client/${client_version}/mms-mathematica-client-${client_version}.zip"
curl -sL "https://dl.bintray.com/openmbee/maven/gov/nasa/jpl/mms/mms-mathematica-client/${client_version}/mms-mathematica-client-${client_version}.zip" -o mms-mathematica-client.zip
unzip -q mms-mathematica-client.zip -d build/
rm mms-mathematica-client.zip

(cd build; zip -qr ../MDK.zip . -x ".swagger-*" "LICENSE")
rm -rf build/

echo "Saving as MDK.zip"