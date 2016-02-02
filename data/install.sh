 
#!/bin/sh

echo "Running install.sh for $1"

echo "Cloning opencart repo"
# add version
git clone https://github.com/opencart/opencart.git /www

echo "Installing composer packages"
cd /www && composer.phar install --ignore-platform-reqs