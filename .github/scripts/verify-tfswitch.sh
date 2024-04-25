#!/bin/bash

set -eo pipefail

source ./PKGBUILD

BINARY_VERSION=$(command tfswitch --version | tr -d '\n' | sed 's/^Version: //')
if [ "$BINARY_VERSION" != "v$pkgver" ]; then
  >&2 echo "tfswitch --version reported version $BINARY_VERSION instead of expected version $pkgver"
  exit 3
else
  echo "tfswitch --version reported version $BINARY_VERSION"
fi
