#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# Install Ansible
apt-get update
sudo apt install ansible -y
#sudo ansible-playbook -i /home/ubuntu/ansible/inventory /home/ubuntu/ansible/InstallDocker.yml -u ubuntu
