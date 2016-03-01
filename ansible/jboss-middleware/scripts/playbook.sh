#!/bin/bash

# run the playbook
ANSIBLE_HOME="../provisioning"

ansible-playbook -i $ANSIBLE_HOME/inventory/dev --vault-password-file ~/.ssh/vault_pass $@