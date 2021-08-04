FROM linuxserver/nzbget:version-v21.1
MAINTAINER ullbergm

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Nzbget" \
    org.label-schema.description="Nzbget container with dependencies for sickbeard_mp4_automator" \
    org.label-schema.url="http://ullberg.us/docker/nzbget" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ullbergm/docker-nzbget" \
    org.label-schema.vendor="Magnus Ullberg" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

# install packages
RUN \
 apk add --no-cache \
	ffmpeg \
	py-pip \
	libffi-dev \
	openssl-dev \
	build-base \
	gcc \
	abuild \
	binutils \
	git \
	cmake && \
 pip install --upgrade pip && \
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
	libffi-dev \
	openssl-dev \
	build-base \
	gcc \
	abuild \
	binutils \
	cmake 
