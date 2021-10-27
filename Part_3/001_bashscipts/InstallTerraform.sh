#!/bin/bash

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
# Add the HashiCorp GPG key.
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the official HashiCorp Linux repository.
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update to add the repository, and install the Terraform CLI.
sudo apt-get update && sudo apt-get install terraform

# Verify the installation
terraform -help

# Then install the autocomplete package
touch ~/.bashrc
terraform -install-autocomplete 

# Check version of terraform
terraform --version