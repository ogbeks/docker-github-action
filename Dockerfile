FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install nginx curl net-tools vim -y