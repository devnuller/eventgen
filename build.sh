#!/usr/bin/env sh
# This should be run from the $SPLUNK_HOME/etc/apps/eventgen directory.

# Save for later
CURRENT_PWD=`pwd`
export COPYFILE_DISABLE=true

# Cleanup
rm $CURRENT_PWD/eventgen.spl >/dev/null 2>&1

# Create a build directory that we can use
BUILD_DIR=.build/SA-Eventgen
BUILD_DIR_PARENT=.build
mkdir -p $BUILD_DIR

cp -R * $BUILD_DIR
rm $BUILD_DIR/eventgen.spl >/dev/null 2>&1
rm -rf $BUILD_DIR/.* >/dev/null 2>&1
rm -rf $BUILD_DIR/node_modules >/dev/null 2>&1
find $BUILD_DIR -name '._*' -print -exec rm {} \;
cd $BUILD_DIR_PARENT
tar -czf $CURRENT_PWD/eventgen.spl SA-Eventgen
cd $CURRENT_PWD
rm -rf $BUILD_DIR >/dev/null 2>&1

echo "Build Complete"
