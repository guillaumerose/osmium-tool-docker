FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y build-essential git cmake libboost-program-options-dev libboost-dev libbz2-dev zlib1g-dev libexpat1-dev

WORKDIR /code
RUN git clone https://github.com/osmcode/libosmium.git

WORKDIR /code/libosmium/build
RUN cmake ..
RUN make

WORKDIR /code
RUN git clone -b merge-headers https://github.com/guillaumerose/osmium-tool.git

WORKDIR /code/osmium-tool/build
RUN cmake ..
RUN make

ENV PATH="/code/osmium-tool/build:${PATH}"
