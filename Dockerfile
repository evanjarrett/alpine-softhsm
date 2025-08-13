FROM ghcr.io/openbao/openbao-hsm-nightly:2.4.0-nightly1754588433-amd64
USER root
RUN apk add softhsm opensc