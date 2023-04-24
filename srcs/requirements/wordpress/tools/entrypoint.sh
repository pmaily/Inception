#!/bin/sh

cd /var/www/html

#FILE=/var/www/html/wp-config.php
#if [ ! -f "$FILE" ]; then

#rm -f wp-config.php

wp core download --allow-root

wp config create --dbname=test --dbuser=onlineuser --dbpass=password --dbhost=mariadb --allow-root --extra-php

wp core install --url=https://pmailly.42.fr --title=Site_Title --admin_user=admin_username --admin_password=admin_password --admin_email=your@email.com --allow-root

#fi


/usr/sbin/php-fpm7.3 -F -R
