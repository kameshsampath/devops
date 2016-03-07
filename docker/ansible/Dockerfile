FROM centos:7

MAINTAINER "Kamesh Sampath<kamesh.sampath@hotmail.com>"

LABEL Description="Ansbile Base, which can be used to build docker containers using Ansible" 
LABEL Vendor="Kamesh Sampath" 
LABEL ansible-version="2.0.1"
LABEL Version="1.0"

RUN yum -y update && yum clean all && yum -y install deltarpm && yum -y install epel-release && yum -y install unzip wget gcc python-devel git && yum -y install python-setuptools && yum -y clean all && easy_install pip && pip install --no-cache-dir --ignore-installed -U pip passlib paramiko PyYAML Jinja2 httplib2 six ansible && mkdir -p /etc/ansible/ && echo -e '[local]\nlocalhost' > /etc/ansible/hosts

ONBUILD ADD ansible /srv/ansible

EXPOSE 22