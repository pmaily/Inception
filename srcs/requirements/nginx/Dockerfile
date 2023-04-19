FROM debian:buster

RUN apt-get update -y && apt-get install nginx -y && apt-get install openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=DK/ST=Jylland/O=Company Name" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
