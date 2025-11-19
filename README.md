# PKGBUILDs for Arch User Repository

[![update](https://github.com/kunzese/pkgbuilds/actions/workflows/update-packages.yaml/badge.svg)](https://github.com/kunzese/pkgbuilds/actions/workflows/update-packages.yaml)
[![test](https://github.com/kunzese/pkgbuilds/actions/workflows/test-changed-packages.yaml/badge.svg)](https://github.com/kunzese/pkgbuilds/actions/workflows/test-changed-packages.yaml)
[![release](https://github.com/kunzese/pkgbuilds/actions/workflows/release-packages.yaml/badge.svg)](https://github.com/kunzese/pkgbuilds/actions/workflows/release-packages.yaml)

Automated AUR package maintenance with CI/CD workflows for building, testing, and publishing packages.

## Packages

### [google-cloud-cli-firestore-emulator](https://aur.archlinux.org/packages/google-cloud-cli-firestore-emulator)

A google-cloud-cli component that provides a local, in-memory emulator for Firestore.

- **Upstream**: <https://cloud.google.com/firestore/docs/emulator>

### [tfswitch](https://aur.archlinux.org/packages/tfswitch) / [tfswitch-bin](https://aur.archlinux.org/packages/tfswitch-bin)

A command line tool to switch between different versions of Terraform.

- **Upstream**: <https://github.com/warrensbox/terraform-switcher>
- **Variants**: Source build (`tfswitch`) and binary distribution (`tfswitch-bin`)

## Features

- **Automated Updates**: Daily version checks and automatic pull requests
- **Continuous Testing**: Automated builds and namcap validation on PRs
- **Automatic Publishing**: Packages are released to AUR on merge to master
- **Docker-based CI**: Consistent build environment using containerized workflows
