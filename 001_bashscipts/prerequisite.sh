#!/bin/bash

# Load config values
source vars.conf

#install terraform_______________________________________________________________________
echo -n "Hi Igor Do you need to install terraform (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    . InstallTerraform.sh
else
    echo Not installing terraform
fi

echo "______I Will Create for you an ssh Key into the 'mykey' Folder______"
#ssh-keygen to mykey folder_______________________________________________________________________
ssh-keygen -b 2048 -t rsa -f ../002_mykey/mykey -q -N ""

echo "______I Will initiate the terraform folder and apply the plan ______"
# Terraform init in folder & Apply
terraform -chdir="../terraform/" init 
terraform -chdir="../terraform/" apply



echo -n "Igor Do you want to login in the Ansible-Controller into the new vpc (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    eval $(ssh-agent)
    ssh-add -K ../002_mykey/mykey.pem
    ssh -A ubuntu@"$IPANSIBLECONTROLLER"
else
    echo ok
fi