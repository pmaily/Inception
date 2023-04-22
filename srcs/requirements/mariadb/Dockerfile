FROM debian:buster

RUN apt update -y && apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld && service mysql start && mysql -e "CREATE DATABASE test;" && \
mysql -e "GRANT ALL PRIVILEGES ON test.* TO 'user'@localhost identified by 'password';" && \
mysql -e "grant all privileges on test.* TO 'onlineuser'@'%' identified by 'password';" && \
mysql -e "flush privileges;"

#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]
