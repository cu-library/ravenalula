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
mkdir "$THEME_DIR/css/vendor/rds/$1"
cp "/tmp/rds/dist/$1/rds-cu.css" "$THEME_DIR/css/vendor/rds/$1"

# Bundled .js file
mkdir "$THEME_DIR/js/vendor/rds/$1"
cp "/tmp/rds/dist/$1/rds-cu.js" "$THEME_DIR/js/vendor/rds/$1"

# Vendor SCSS file
mkdir "$THEME_DIR/scss/vendor/rds/$1"
cp "/tmp/rds/src/_core/scss/tools/_vars.scss" "$THEME_DIR/scss/vendor/rds/$1"

# Cleanup
rm -rf /tmp/rds
