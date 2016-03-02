#!/bin/bash

# This script has to be run on machines which will act as ansbile control machine

echo "Setup Ansible"

pip install --no-cache-dir --ignore-installed -U passlib paramiko PyYAML Jinja2 httplib2 six ansible

## Workaround for paramkio failures to update known hosts
echo 'vagrant' | script -c "sudo -S -u vagrant touch /home/vagrant/.ssh/known_hosts"