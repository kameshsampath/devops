# ansible-middleware-playbooks

## Purpose

This repository provides a set of generic roles and reusable playbooks for deploying JBoss Middleware and associated CI / CD tooling. 

## Instructions

1. Put the "jboss-eap-6.4.0-installer.jar” or any other installable on to the softwares folder ( if not create the folder at $PROJECT_ROOT)  that you find at the root of the extracted zip 
2. Check out the vars folder for variables used in each roles, typically all eap related variables are in $PROJECT_HOME/vars/eap_vars.yml
3. If you have vagrant installed then from the root of the project do `vagrant up`, this should spin up 5 centos boxes one for JON, one for EWS and 3 for EAP one master and two slave nodes 
4. Once the machines are up you can check it for readiness for ansible using  ```ansible -i provisioning/inventory all -m ping  ``` , this will tell you whether all hosts are ssh’able with the settings on inventory/group_vars/host_vars
5. Do a dry run using the command ```ansible-playbook -i provisioning/inventory provisioning/eap.yml --check``` 
6. If you have installed ansible on local, form the project root fire ```ansible-playbook -i provisioning/inventory provisioning/eap.yml``` 

## Relevant Links

[Ansible roles](http://docs.ansible.com/ansible/playbooks_roles.html/ "Ansible Roles") 

