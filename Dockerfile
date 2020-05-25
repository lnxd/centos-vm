FROM centos:8

# Prepare
RUN yum check-update -y
RUN yum update -y
RUN yum clean all -y
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