FROM debian

USER root

RUN apt-get update && apt-get install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi 

COPY ./server.c ./home/server/server.c
COPY ./nginx.conf etc/nginx/nginx.conf
COPY ./run_server.sh ./home/server/run_server.sh

WORKDIR /home/server/

RUN gcc server.c -lfcgi -o server \
    && chmod +x run_server.sh

CMD [ "/home/server/run_server.sh" ]