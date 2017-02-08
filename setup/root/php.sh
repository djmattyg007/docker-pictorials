#!/bin/bash

# Exit script if return code != 0
set -e

pacman -S --noconfirm --noprogressbar --color=never php-gd php-sqlite

cat > /etc/php/conf.d/60-pictorials-conf.ini <<EOF
extension=gd.so
extension=pdo_sqlite.so
extension=sqlite3.so
EOF
