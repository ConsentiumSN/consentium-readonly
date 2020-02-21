FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl libicu60 libusb-1.0-0 libcurl3-gnutls

RUN apt-get install libssl1.0.0 libssl-dev -y

WORKDIR /app

ADD ./nodeos /app
ADD ./cleos /app
ADD ./keosd /app

ADD ./my-genesis.json /app

ADD ./entrypoint.sh /app

RUN chmod +777 /app/entrypoint.sh
RUN chmod 777 /app/nodeos
RUN chmod 777 /app/cleos
RUN chmod 777 /app/keosd

