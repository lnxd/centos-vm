FROM centos:8

# Prepare
RUN yum -y check-update || { rc=$?; [ "$rc" -eq 100 ] && exit 0; exit "$rc"; }
RUN yum update -y
RUN yum install sudo nano curl wget -y
RUN yum clean all -y
RUN useradd docker && \
    echo docker:docker | chpasswd
#RUN addgroup sudo
#RUN adduser docker sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV HOME /home/docker
WORKDIR /home/docker