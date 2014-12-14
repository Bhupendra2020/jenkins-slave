# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu:trusty
MAINTAINER Ervin Varga <ervin.varga@gmail.com>

# Make sure the package repository is up to date.
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update

# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
RUN apt-get install -y --no-install-recommends openjdk-7-jdk

# Add user jenkins to the image
RUN echo "root:password" | chpasswd  
RUN useradd jenkins  
RUN echo "jenkins:jenkins" | chpasswd  

RUN mkdir -p /var/run/supervisord  
ADD supervisord.conf /etc/supervisord.conf  
  
EXPOSE 22  
CMD ["/usr/bin/supervisord"]  
