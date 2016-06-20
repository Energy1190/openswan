FROM debian:jessie

ENV VERSION=2.6.48

RUN apt-get update && \
	apt-get install -q -y -o \
	libgmp3-dev \
	gawk \
	flex \
	bison \
	iproute \
	iptables \
	sed \
	python \
	wget \
 && rm -rf /var/lib/apt/lists/*
 
RUN wget https://download.openswan.org/openswan/openswan-${VERSION}.tar.gz && \
	tar -zxvf openswan-latest.tar.gz -C /usr/src/ && \
	rm -f openswan-${VERSION}.tar.gz && \
	cd /usr/src/openswan-${VERSION} && \
	make programs && \
	make install

EXPOSE 500/udp 4500/udp

CMD ["/usr/bin/tail", "-f", "/dev/null"]
