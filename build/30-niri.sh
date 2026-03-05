#!/usr/bin/bash

set -eoux pipefail

###############################################################################
# Example: Swap GNOME Desktop with COSMIC Desktop
###############################################################################
# This example demonstrates replacing the GNOME desktop environment with
# System76's COSMIC desktop from their COPR repository.
#
# COSMIC is a new desktop environment built in Rust by System76.
# https://github.com/pop-os/cosmic-epoch
#
# To use this script:
# 1. Rename to remove .example extension: mv 30-cosmic-desktop.sh.example 30-cosmic-desktop.sh
# 2. Build - scripts run in numerical order automatically
#
# WARNING: This removes GNOME and replaces it with COSMIC. Only use this if
# you want COSMIC as your desktop environment instead of GNOME.
###############################################################################

# Source helper functions
# shellcheck source=/dev/null
source /ctx/build/copr-helpers.sh

# Install COSMIC desktop from System76's COPR
# Using isolated pattern to prevent COPR from persisting
copr_install_isolated "avengemedia/dms" \
  dms

dnf5 install -y niri

systemctl --user add-wants niri.service dms

echo "::group:: Install Additional Utilities"

dnf5 install -y \
  kitty \
  flatpak \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-gnome \
  gnome-keyring

echo "Additional utilities installed"
echo "::endgroup::"

echo "NIRI desktop installation complete!"
echo "After booting, select 'NIRI' session at the login screen"
