#!/bin/bash

set -eo pipefail

PACKAGE=$1
TEMPDIR="$(mktemp -d)"

source "./$PACKAGE/PKGBUILD"

git clone "ssh://aur@aur.archlinux.org/$1.git" "$TEMPDIR"
cp ./"$PACKAGE"/{PKGBUILD,.SRCINFO} "$TEMPDIR"

pushd "$TEMPDIR"

if [ -n "$(git status --porcelain)" ]; then
  # Uncommitted changes
  git add {PKGBUILD,.SRCINFO}
  git commit -m "chore($PACKAGE): release version $pkgver-$pkgrel"
  git push
else
  # Working directory clean
  echo "No changes detected"
fi
