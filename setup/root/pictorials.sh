#!/bin/bash

# Exit script if return code != 0
set -e

pacman -S --noconfirm --noprogressbar --color=never composer

mkdir -p /data/pictorials /var/cache/pictorials /var/lib/pictorials /var/log/pictorials /srv/http
chown http:http /var/cache/pictorials /var/lib/pictorials /var/log/pictorials
chmod 0755 /var/cache/pictorials /var/lib/pictorials /var/log/pictorials

curl -L -sS -o /data/pictorials.tar.gz https://github.com/djmattyg007/pictorials/archive/master.tar.gz
cd /data/pictorials
tar --strip-components=1 -xvf ../pictorials.tar.gz
rm ../pictorials.tar.gz

composer install --no-dev --no-suggest --no-interaction --optimize-autoloader --no-progress --no-ansi

pacman -R --noconfirm --noprogressbar --color=never composer
