#!/bin/sh

echo "Running install.sh for $1"

# TODO: Download selected version via  (from docker-sho-manager) from githup.com/opencart/opencart and run installer

echo "Cloning opencart repository"
git clone --branch $1 --depth 1 https://2245dfb67d208f3503081b38814bdd54e04368f7:x-oauth-basic@github.com/opencart/opencart.git /www

echo "Installing composer packages"
cd /www && composer.phar self-update && composer.phar config -g github-oauth.github.com 2245dfb67d208f3503081b38814bdd54e04368f7 && composer.phar install --ignore-platform-reqs

echo "Setting filesystem permissions"
chown -R www-data /www
chgrp -R www-data /www


echo "Setting up configurations files"
# Rename these files so the shop can be configured
mv -f /www/upload/config-dist.php /www/upload/config.php
mv -f /www/upload/admin/config-dist.php /www/upload/admin/config.php
# These will be used when the script runs the config for the shop automatically
# mv -f /config/config.php /www/upload/config.php
# mv -f /config/admin/config.php /www/upload/admin/config.php

echo "Installation completed"