#!/bin/sh

cd /var/www/html

wp core download --allow-root

wp config create --dbname=test --dbuser=onlineuser --dbpass=password --dbhost=mariadb --allow-root

wp core install --url=pmailly.42.fr --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com --allow-root

/usr/sbin/php-fpm7.3 -F -R
