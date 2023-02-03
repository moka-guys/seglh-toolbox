FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/London"

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install \
	git \
	build-essential \
	bedtools \
	bcftools \
	samtools \
	bwa \
	libz-dev libssl-dev \
	openssl \
	libpng-dev \
	mysql-client  \
	libmysqlclient-dev

# install kentUtils
RUN cd /tmp && \
	git clone https://github.com/ENCODE-DCC/kentUtils.git && \
	cd kentUtils && \
	git checkout v302.1.0 && \
	make && \
	cp -rp bin/* /usr/local/bin && \
	cd .. && rm -rf kentUtils

# set working directory
RUN mkdir /work
WORKDIR /work

# install scripts
COPY ./tools/* /usr/local/bin
