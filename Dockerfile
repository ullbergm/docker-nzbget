FROM linuxserver/nzbget
MAINTAINER ullbergm

# install packages
RUN \
 apk add --no-cache \
	ffmpeg \
	py-pip \
	python-dev \
	libffi-dev \
	openssl-dev \
	build-base \
	gcc \
	abuild \
	binutils \
	git \
	cmake && \
 pip install requests && \
 pip install requests[security] && \
 pip install requests-cache && \
 pip install babelfish && \
 pip install "guessit<2" && \
 pip install deluge-client && \
 pip install qtfaststart && \
 pip install "subliminal<2" && \
 pip install stevedore==1.19.1 && \
 apk del --no-cache \
	python-dev \
	libffi-dev \
	openssl-dev \
	build-base \
	gcc \
	abuild \
	binutils \
	cmake 
