#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

# Change Debian to Stable
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list

# Update packages list and update system
apt update
apt upgrade -y

# Install Apache
apt install wget php php-cgi php-mysqli php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql php-curl php-imagick php-xml php-zip php-gd php-intl -y

apt install apache2 curl software-properties-common gnupg2 -y


# Install CertBot
sudo apt install certbot python3-certbot-apache -y


chmod -R 755 /var/www/html/
chown -R www-data:www-data /var/www/html/

systemctl restart apache2
