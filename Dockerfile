FROM ubuntu

RUN apt-get update -y && apt-get install -y iproute2 iputils-ping curl

