#!/bin/bash

set -eo pipefail

PACKAGE=$(basename "$0" .sh)
LATEST_VERSION=$(curl -s https://api.github.com/repos/warrensbox/terraform-switcher/releases/latest | jq -r '.tag_name')

pushd "$PACKAGE"

source ./PKGBUILD

if [ "$LATEST_VERSION" != "$pkgver" ]; then
  echo "::group::Update PKGBUILD pkgver to $LATEST_VERSION"
  sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
  echo "::endgroup::"

  echo "::group::Update package checksums"
  env EUID=1 updpkgsums --nocolor PKGBUILD
  echo "::endgroup::"

  echo "::group::Generate .SRCINFO"
  env EUID=1 makepkg --printsrcinfo | tee .SRCINFO
  echo "::endgroup::"

  echo "::group::Build and install package"
  env EUID=1 makepkg -sic --noconfirm
  echo "::endgroup::"

  echo "::group::Check output of binary against expected latest version"
  BINARY_VERSION=$(command tfswitch --version | tr -d '\n' | sed 's/^Version: //')
  if [ "$BINARY_VERSION" != "$LATEST_VERSION" ]; then
    >&2 echo "tfswitch --version reported version $BINARY_VERSION instead of expected version $LATEST_VERSION"
    exit 3
  else
    echo "tfswitch --version reported version $BINARY_VERSION"
  fi
  echo "::endgroup::"
fi

echo "LATEST_VERSION=$LATEST_VERSION" >> "$GITHUB_ENV"
