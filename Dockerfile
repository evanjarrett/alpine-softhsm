FROM openbao/openbao-hsm-ubi:2.3.2

USER root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install EPEL repository and SoftHSM
RUN microdnf install softhsm -y

USER openbao