#!/bin/sh

cd /var/www/html

wp core download --allow-root

wp config create --dbname=wordpress --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root --extra-php

wp core install --url=https://pmailly.42.fr --title=Site_Title --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=your@email.com --allow-root

wp user create $WP_NORMAL_USER random@example.com --user_pass=$WP_NORMAL_PASSWORD --role=subscriber --allow-root

wp theme install twentyseventeen --allow-root

wp theme activate twentyseventeen --allow-root

/usr/sbin/php-fpm7.3 -F -R
