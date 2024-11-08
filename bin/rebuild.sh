#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PARENT_DIR="$(dirname -- "${SCRIPT_DIR}")"

git add ${PARENT_DIR}/nixos/hardware-configuration.nix -f
nixos-rebuild switch --flake ${SCRIPT_DIR}#
git restore --staged ${PARENT_DIR}/nixos/hardware-configuration.nix
