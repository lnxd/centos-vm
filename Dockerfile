FROM centos:8

# Prepare
RUN yum check-update
RUN yum update
RUN yum clean all
RUN adduser \
    --disabled-password \
    --gecos "" \
    "docker"
RUN echo 'docker:docker' | chpasswd
RUN addgroup sudo
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV HOME /home/docker
WORKDIR /home/docker