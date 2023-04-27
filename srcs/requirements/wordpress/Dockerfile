FROM debian:buster

RUN apt-get update -y &&  apt-get install -y php7.3 php-mysqli php-fpm mariadb-client

RUN apt-get install -y curl &&  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp cli update

RUN mkdir -p /run/php/ && mkdir -p /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entrypoint.sh /bin/

EXPOSE 9000

ENTRYPOINT ["/bin/entrypoint.sh"]
