#!/usr/bin/bash

set -eoux pipefail

# shellcheck source=/dev/null
source /ctx/build/copr-helpers.sh

copr_install_isolated "fmonteghetti/keyd" \
  keyd

systemctl enable keyd

mkdir -p /etc/keyd
cat >/etc/keyd/default.conf <<'KEYD'
[ids]
*

[main]
# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)
KEYD
