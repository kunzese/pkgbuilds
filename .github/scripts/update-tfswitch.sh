#!/bin/bash

set -eo pipefail

PACKAGES=(tfswitch tfswitch-bin)
LATEST_VERSION=$(curl -s https://api.github.com/repos/warrensbox/terraform-switcher/releases/latest | jq -r '.tag_name')

for package in "${PACKAGES[@]}"; do
  pushd "$package" > /dev/null
  source ./PKGBUILD
  if [ "$LATEST_VERSION" != "$pkgver" ]; then
    echo "::group::Update PKGBUILD pkgver to $LATEST_VERSION"
    sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
    echo "::endgroup::"

    echo "::group::Update package checksums"
    env EUID=1 updpkgsums --nocolor PKGBUILD
    echo "::endgroup::"

    echo "::group::Generate .SRCINFO"
    env EUID=1 makepkg --printsrcinfo | tee .SRCINFO
    echo "::endgroup::"
  fi
  popd > /dev/null
done

if [[ -n $GITHUB_ENV ]]; then
  echo "LATEST_VERSION=$LATEST_VERSION" >> "$GITHUB_ENV"
fi
