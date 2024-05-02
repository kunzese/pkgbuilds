#!/bin/bash

set -eo pipefail

echo "::group::Install google-cloud-cli"
git clone https://aur.archlinux.org/google-cloud-cli.git
pushd "google-cloud-cli" > /dev/null
env EUID=1 makepkg -si --noconfirm
popd > /dev/null
rm -rf google-cloud-cli
echo "::endgroup::"
