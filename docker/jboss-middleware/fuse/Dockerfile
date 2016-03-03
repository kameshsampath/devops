FROM centos:7

MAINTAINER "Kamesh Sampath<kamesh.sampath@hotmail.com>"

LABEL Description="A RedHat Fuse 6.2.1 container" 
LABEL Vendor="Kamesh Sampath" 
LABEL fuse-version="6.2.1.redhat-084"
LABEL maven-version="3.3.9"
LABEL java-version="openjdk-1.7.0"
LABEL ansible-version="2.0.1"
LABEL Version="1.0"

# TODO - clean up the docker container 

# Setup yum
RUN yum -y update && yum clean all && yum -y install epel-release && yum -y install deltarpm && yum -y install unzip wget gcc python-devel git && yum -y install python-setuptools python-setuptools-devel && yum -y clean all 

# Install Ansible
RUN easy_install pip && pip install --no-cache-dir --ignore-installed -U pip passlib paramiko PyYAML Jinja2 httplib2 six ansible 

RUN mkdir -p /etc/ansible/

RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

ADD ansible /srv/redhat_fuse

WORKDIR /srv/redhat_fuse

# Start Fuse Install
RUN ansible-playbook fuse.yml  -c local

# Remove the installer and ansible scripts to save space
RUN rm -rf /srv/redhat_fuse

ENV JAVA_HOME /usr
ENV FUSE_HOME /jboss-fuse-6.2.1.redhat-084

# Fuse install directory 
WORKDIR $FUSE_HOME/bin

# Volumes that can be mounted ( TODO mount only whats is neded)
VOLUME [$FUSE_HOME]

EXPOSE 22 8181