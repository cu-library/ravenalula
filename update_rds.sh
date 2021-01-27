#! /usr/bin/env bash

if [ "$1" == "" ]; then
    echo "Please specify the version"
    exit 1
fi

# Bash is gross.
THEME_DIR="$(dirname "$(readlink -f "$0")")"

cd /tmp
git clone https://github.com/ravendesignsystem/rds.git

if [ ! -d "/tmp/rds/dist/$1" ]; then
    echo "Release $1 doesn't exist"
    rm -rf /tmp/rds
    exit 1
fi

# Bundled .css file
mkdir -p "$THEME_DIR/css/vendor/rds/$1"
cp "/tmp/rds/dist/$1/core.css" "$THEME_DIR/css/vendor/rds/$1"

# Bundled .js file
mkdir -p "$THEME_DIR/js/vendor/rds/$1"
cp "/tmp/rds/dist/$1/core.js" "$THEME_DIR/js/vendor/rds/$1"

# Vendor SCSS file and include-media library
mkdir -p "$THEME_DIR/scss/vendor/rds/$1"
cp "/tmp/rds/dist/_core/scss/tools/_vars.scss" "$THEME_DIR/scss/vendor/rds/$1"
cp "/tmp/rds/dist/_core/scss/tools/_include-media.scss" "$THEME_DIR/scss/vendor/rds/$1"

# Cleanup
rm -rf /tmp/rds
