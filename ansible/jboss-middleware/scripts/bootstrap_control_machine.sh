#!/bin/bash

# This script has to be run on machines which will act as ansbile control machine

echo "Setup Ansible"

sudo pip install --no-cache-dir --ignore-installed -U passlib paramiko PyYAML Jinja2 httplib2 six ansible

sudo cp /vagrant/config/ansible.cfg /home/vagrant/.ansible.cfg