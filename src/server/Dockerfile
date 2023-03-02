FROM debian

RUN apt-get update && apt-get install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi \
    && rm -fr /var/lib/apt/lists

COPY ./server.c ./home/server/server.c
COPY ./run_server.sh ./home/server/run_server.sh

WORKDIR /home/server/

RUN gcc server.c -lfcgi -o server \
    && chmod +x run_server.sh

RUN groupadd -g 999 server && \
    useradd -r -u 999 -g server server

USER server

CMD [ "/home/server/run_server.sh" ]