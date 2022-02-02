#!/bin/bash
set -e

VERSION=`git describe --tags`

echo ""
echo "  xbar ${VERSION}..."
echo ""
echo -n $VERSION > .version

~/go/bin/wails build -o xbar
