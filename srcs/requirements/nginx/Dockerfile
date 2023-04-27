FROM debian:buster

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 -subj "/C=DK/ST=Jylland/O=Company Name" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
