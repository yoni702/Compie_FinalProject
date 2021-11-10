Objectives:
1. Deploy a static website running in a docker container on an ec2 instance in a private
subnet (no access from the web)
 
2. Making the website accessible from the external web by ALB on ports 80 and 443
3. The static website should be highly available (multi-AZ)
4. Static website server should be configured using ansible playbooks
5. AWS Infrastructure components should be created using terraform
By the end of this section you should have a static website running in a docker container on two private ec2 instances in multi AZ. The website should be accessible using the ALB.
Remember to create the necessary SG rules so that you can access the website.


You answer should include:
1. Your Git repository with the infrastructure and deployment automation code including a
step-by-step README.md that explains how to deploy your infrastructure
2. A demonstration of a working environment (Recorded Demo)

-----------------------------------------------------------------------------------------------
                                       GIT REPOSITORY
-----------------------------------------------------------------------------------------------
https://github.com/yoni702/FinalProject.git



-----------------------------------------------------------------------------------------------
                                    RUN THE APP
-----------------------------------------------------------------------------------------------

001_Clone  the FinalProject GitHub
    git clone https://github.com/yoni702/FinalProject.git

cd FinalProject/Part_1/001_bashscipts/

run: 
cd FinalProject/Part_1/001_bashscipts/
. prerequisite.sh

    it will ask you if you want to :
        - Install terafform
        - Create a SSH-keygen on "002_mykey" folder
        - Initiate and apply terraform
        _ you will need to input my Access Key ID & Secret Access Key (there are on a txt file in the tar)
        _ after the terraform finish you will be asked if you want to ssh to "Ansible-Controller" say yes 

the terraform output the DNS name of the ALB you should copy it to navigate in your browser


002_ in "Ansible-Controller" instance you will find an ansible folder  you will need to run playbook
    cd 004_ansible/
    ansible-playbook -i inventory WebInstance.yml

you should be abble to see the website from the net now


-----------------------------------------------------------------------------------------------
                                      NEED TO FINISH
-----------------------------------------------------------------------------------------------
- DNS NAME OUTPUT