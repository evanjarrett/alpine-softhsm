FROM ghcr.io/openbao/openbao-hsm-nightly:2.4.0-nightly1754588433-amd64
USER root
# Update Alpine packages
RUN apk update

# Install compilation tools
RUN apk add --no-cache \
  git \
  gcc \
  g++ \
  make \
  cmake \
  pkgconfig \
  openssl-dev \
  pcsc-lite-dev \
  libusb-dev \
  autoconf \
  automake \
  libtool

RUN cd / && git clone https://github.com/CardContact/sc-hsm-embedded.git
WORKDIR /sc-hsm-embedded
RUN autoreconf -fi && ./configure
RUN make && make install
WORKDIR /
RUN apk add --no-cache opensc-dev ccid pcsc-lite openssl libtool

RUN cp /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh.orig

COPY ./pcscd-wrapper.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server", "-dev", "-dev-no-store-token"]