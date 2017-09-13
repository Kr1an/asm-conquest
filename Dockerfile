FROM ubuntu:latest

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
	git \
	vim \
	g++ \
	nasm \
	apt-utils \
	g++-multilib \
	gdb;
RUN apt-get install -y --no-install-recommends ca-certificates	
