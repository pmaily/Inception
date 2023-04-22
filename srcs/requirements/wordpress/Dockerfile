FROM debian:buster

RUN apt-get update -y && mkdir -p /var/www/ && cd /var/www && apt-get install -y wget && wget http://fr.wordpress.org/latest-fr_FR.tar.gz && tar -xzvf latest-fr_FR.tar.gz && rm -f latest-fr_FR.tar.gz 

RUN apt-get install -y php7.3 php-mysqli php-fpm mariadb-server mariadb-client wget

RUN apt-get install -y curl &&  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp cli update

#RUN wp config create --dbname=wordpress --dbuser=user --dbpass=password --dbhost=localhost --dbprefix=wp_ --allow-root --path=/var/www/wordpress

RUN mkdir -p /run/php/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
#COPY ./conf/wp-config.php /var/www/wordpress
COPY ./tools/entrypoint.sh /bin/

EXPOSE 9000

ENTRYPOINT ["/bin/entrypoint.sh"]
