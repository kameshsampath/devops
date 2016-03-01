#!/bin/bash

yum -y update && yum clean all

# Zero out empty spaces on the Volume to enable better compression
# of the virtual hardisk
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync

# TODO anything other needed ?