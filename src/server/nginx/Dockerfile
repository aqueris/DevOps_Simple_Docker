FROM debian

RUN apt-get update && apt-get install -y nginx \
    && rm -fr /var/lib/apt/lists

COPY ./nginx.conf etc/nginx/nginx.conf

WORKDIR /home/server/

RUN groupadd -g 999 server && \
    useradd -r -u 999 -g server server

USER server

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]