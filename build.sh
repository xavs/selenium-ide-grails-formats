#!/bin/bash
 
APP_NAME=grails-formatters          # short-name, jar and xpi files name. Must be lowercase with no spaces
APP_VERSION=1.0
CHROME_PROVIDERS="content"  # which chrome providers we have (space-separated list)
ROOT_DIRS="defaults"         # ...and these directories       (space separated list)
 
ROOT_DIR=`pwd`
TMP_DIR=build
 
# remove any left-over files from previous build
rm -f $APP_NAME.jar $APP_NAME.xpi
rm -rf $TMP_DIR
 
mkdir -p $TMP_DIR/chrome/content/formats
 
cp -v -R chrome/content $TMP_DIR/chrome
cp -v install.rdf $TMP_DIR
cp -v chrome.manifest $TMP_DIR
 
# generate the XPI file
cd $TMP_DIR
echo "Generating $APP_NAME.xpi..."
zip -r ../$APP_NAME-$APP_VERSION.xpi *
 
cd "$ROOT_DIR"