FROM registry.access.redhat.com/ubi9-minimal:9.6

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Install EPEL repository and SoftHSM
RUN microdnf install softhsm -y