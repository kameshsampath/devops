#!/bin/bash
echo "Update and Install Repositories"
rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update
yum -y install dkms
easy_install pip
pip install --upgrade pip httplib2