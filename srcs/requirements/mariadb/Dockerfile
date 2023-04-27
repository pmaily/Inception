FROM debian:buster

ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt update -y && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld && service mysql start && mysql -e "CREATE DATABASE wordpress;" && \
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@localhost identified by 'password';" && \
mysql -e "grant all privileges on wordpress.* TO '${DB_USER}'@'%' identified by '${DB_PASSWORD}';" && \
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');" && \
mysql -e "flush privileges;"

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
