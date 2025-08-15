FROM ghcr.io/openbao/openbao-hsm-nightly:2.4.0-nightly1754588433-amd64
USER root
RUN apk add --no-cache opensc-dev ccid
COPY ./pcscd-wrapper.sh /usr/local/bin
RUN chmod +x /usr/local/bin/pcscd-wrapper.sh
ENTRYPOINT ["pcscd-wrapper.sh"]
CMD ["server", "-dev", "-dev-no-store-token"]