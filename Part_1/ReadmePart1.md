# This Section contains part 2 and 3 of the final project

#### Table of Contents
 * [List of Tools & Technologies](#Technologies)
 * [Git Repository](#Git)
 * [Prerequisites on your Workstation](#Prerequisites)
 * [Jenkins on your Workstation](#Jenkins)
 * [If you want to check via eksctl, Dashboard](#check)


 ## Git Repository <a id="Git"></a>
    https://github.com/yoni702/FinalProject.git

 
 ## List of Tools & Technologies <a id="Technologies"></a>
    - Jenkins
    - Terraform
    - EKS,S3,DynamoDB,ECR,
    _ ECR
    _ Docker



-----------------------------------------------------------------------------------------------
                                    RUN THE APP
-----------------------------------------------------------------------------------------------

## 001_Clone  the FinalProject GitHub
```
    git clone https://github.com/yoni702/FinalProject.git
```
```
    cd FinalProject/Part_1/001_bashscipts/
```

``` 
cd FinalProject/Part_1/001_bashscipts/
. prerequisite.sh
```

### The Script will ask you to :
```
    1- Install terafform (if you not needed Skip this )
    2- Create a SSH-keygen on "002_mykey" folder (Do not Skip this )
        SAY:    "y"
    3- Initiate and apply terraform
        SAY:    "y"
    4_ Input my Access Key ID & Secret Access Key 
    5_ After the terraform finish you will be asked if you want to ssh "Ansible-Controller"
        SAY:    "y" 
```
The terraform output the DNS name of the ALB you should copy it to navigate in your browser 
(it will be blank until the Ansible playbook will run)


## 002_ Into "Ansible-Controller" EC2 Instance 
(you will find an Ansible folder  you will need to run playbook)

```
    cd 004_ansible/
    ansible-playbook -i inventory WebInstance.yml
```
DONE!!!
You should be abble to see the website from the net now
