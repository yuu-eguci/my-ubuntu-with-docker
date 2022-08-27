FROM ubuntu:latest

WORKDIR /

RUN apt update
# lsb-release は ubuntu のバージョンを簡単に見るツールです。
RUN apt install -y lsb-release
