FROM ghcr.io/openbao/openbao-hsm-nightly:2.4.0-nightly1754588433-amd64
USER root
RUN apk add --no-cache opensc-dev ccid

RUN cp /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh.orig

COPY ./pcscd-wrapper.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server", "-dev", "-dev-no-store-token"]