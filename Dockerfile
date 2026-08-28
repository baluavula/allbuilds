FROM ubuntu:22.04
WORKDIR /tmp/koti
RUN apt update -y
COPY scr dsr

