FROM debian:buster

RUN apt-get update -y && cd /var/www && sudo wget http://fr.wordpress.org/latest-fr_FR.tar.gz && sudo tar -xzvf latest-fr_FR.tar.gz && sudo rm -f latest-fr_FR.tar.gz 

RUN apt-get -y install php-cli php-mysql php-curl php-gd php-intl && sudo apt-get install -y php-fpm

EXPOSE 9000

ENTRYPOINT
