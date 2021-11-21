# This Section contains part 1 of the Final Project

#### Table of Contents
 * [Git Repository](#Git)
 * [000_Video Link](#Video)
 * [001_Clone  the FinalProject GitHub](#clone)
 * [002_Run The Prerequisite Script](#script)
 * [003_ Into "Ansible-Controller" EC2 Instance ](#controller)
 * [004_ Destroy Terraform ](#destroy)

 ## Video <a id="Video"></a>
    not done yet

 ## Git Repository <a id="Git"></a>
    https://github.com/yoni702/FinalProject.git

 
 ## List of Tools & Technologies <a id="Technologies"></a>
    - Terraform
    - Ansible

## 001_Clone  the FinalProject GitHub <a id="clone"></a>
```
git clone https://github.com/yoni702/FinalProject.git
```
```
cd FinalProject/Part_1/001_bashscipts/
```


### 002_Run The Prerequisite Script <a id="script"></a>
``` 
cd FinalProject/Part_1/001_bashscipts/
. prerequisite.sh
```
#### 1- Install terraform (if you not needed Skip this )
#### 2- Create a SSH-keygen on "002_mykey" folder (Do not Skip this )
```
"y" 
```
#### 3- Initiate and apply Terraform
```
"y" 
```
#### 4_ Input my Access Key ID & Secret Access Key 
#### 5_ After the terraform finish you will be asked if you want to ssh "Ansible-Controller"
```
"y" 
```

The terraform output the DNS name of the ALB you should copy it to navigate in your browser 
(it will be blank until the Ansible playbook will run)


## 003_ Into "Ansible-Controller" EC2 Instance  <a id="controller"></a>
Tip: You will find an Ansible folder  you will need to run playbook

```
    cd FinalProject/Part_1/004_ansible/
    ansible-playbook -i inventory WebInstance.yml
    don't forget to logout from the controller
```

DONE!!!
You should be abble to see the website from the net now

## 004_ Destroy Terraform <a id="destroy"></a>
Tip: Don't forget to Logout from Ansible-Controller 
```
    cd FinalProject/Part_1/003_terraform/
    terraform destroy
```

