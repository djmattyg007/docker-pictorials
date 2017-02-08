#!/bin/bash

# Exit script if return code != 0
set -e

pacman -S --noconfirm --noprogressbar --color=never php-sqlite

cat > /etc/php/conf.d/60-pictorials-conf.ini <<EOF
extension=pdo_sqlite.so
extension=sqlite3.so
EOF
