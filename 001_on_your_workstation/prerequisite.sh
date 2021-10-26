#!/bin/bash

#install terraform_______________________________________________________________________
echo -n "Do you need to install terraform (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
    echo Yes
    . InstallTerraform.sh
else
    echo Not installing terraform
fi

#ssh-keygen to mykey folder_______________________________________________________________________
ssh-keygen -b 2048 -t rsa -f ../mykey/mykey -q -N ""

# Terraform init in folder & Apply
terraform -chdir="../terraform/" init 
terraform -chdir="../terraform/" apply

