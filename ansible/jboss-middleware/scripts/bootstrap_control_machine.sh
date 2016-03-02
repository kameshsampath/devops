#!/bin/bash

# This script has to be run on machines which will act as ansbile control machine

echo "Setup Ansible"

pip install --no-cache-dir --ignore-installed -U passlib paramiko PyYAML Jinja2 httplib2 six ansible

mkdir /etc/ansible && cp /vagrant/config/ansible.cfg /etc/ansible/.ansible.cfg

mkdir /home/vagrant/ansible
chown vagrant:vagrant /home/vagrant/ansible

## a vault pass file - typically used to demonstate encrypting passwords !! ONLY FOR DEMO !!!
echo 'vagrant' | script -c "sudo -S -u vagrant echo 'redhat' | tee /home/vagrant/.ssh/ansible_vault_pass_file"