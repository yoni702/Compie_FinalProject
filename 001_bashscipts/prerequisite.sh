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


#ssh-keygen to mykey folder_______________________________________________________________________
echo -n "Hi Igor Do you need a new ssh keygen (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    ssh-keygen -b 2048 -t rsa -f ../002_mykey/mykey -q -N ""
else
    echo Not creating ssh-keygen
fi

# Terraform init in folder & Apply

echo -n "______Do you want to imitialize and apply  terraform______ (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo Yes
    terraform -chdir="../003_terraform/" init 
    terraform -chdir="../003_terraform/" apply
else
    echo Not installing terraform
fi

echo -n "Igor Do you want to login in the Ansible-Controller: $IPANSIBLECONTROLLER  (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    eval $(ssh-agent)
    ssh-add -K ../002_mykey/mykey
    ssh -A ubuntu@"$IPANSIBLECONTROLLER"    
else
    echo ok
fi

echo -n "Igor Do you want to run the Ansible Playbook (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    sudo ansible-playbook -i /home/ubuntu/004_ansible/inventory /home/ubuntu/004_ansible/WebInstance.yml -u ubuntu   
else
    echo ok
    
fi
