#!/bin/bash

# Load config values
source vars.conf

#install terraform_______________________________________________________________________
echo -n "Do you need to install terraform (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    . InstallTerraform.sh
else
    echo "Not installing terraform"
fi


#ssh-keygen to mykey folder_______________________________________________________________________
echo -n "Do you need a new ssh-keygen into 002_mykey folder (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    ssh-keygen -b 2048 -t rsa -f ../002_mykey/mykey -q -N ""
else
    echo "Not creating ssh-keygen"
fi

# Terraform init in folder _______________________________________________________________________

echo -n "Do you want to initialize the terraform folder (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    terraform -chdir="../003_terraform/" init 
else
    echo "Not installing terraform"
fi

# Terraform Apply_______________________________________________________________________
echo -n "Do you want to apply terraform configuration (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    terraform -chdir="../003_terraform/" apply
else
    echo "Not Apply terraform configuration"
fi

# Login in Ansible-Controller _______________________________________________________________________
echo -n "Igor Do you want to login in the Ansible-Controller by ssh-forwarding (to be able to ssh into privates instances) (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    . Login_in_Ansible_Controller.sh  
else
    echo "not login in Ansible-Controller: $IPANSIBLECONTROLLER "
fi

