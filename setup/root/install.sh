#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh

echo "Install dhcpcd package without udev support"
aur_start
aur_build dhcpcd-without-systemd
aur_finish

echo "Install and configure additional PHP packages"
source /root/php.sh

echo "Download and install Pictorials"
source /root/pictorials.sh

# Cleanup
pacman_cleanup
