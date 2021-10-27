Objectives:
1. Create an EKS cluster in a dedicated VPC, the configuration should include:
(You can choose the tool that you prefer, eksctl/cloudformation/terraform)
a. Dedicated VPC
b. 2 public subnets
c. 2 private subnets
d. 2 availability zones (Public & Private in each az)
e. Use 100% spot instances



2. Infra Autoscaling - Worker nodes should be automatically added and removed from your
nodegroup when required. Up to 10 nodes. You should choose the appropriate type of instances for the same.
You answer should include:



1. Overview of your solution (Architecture diagram can be included)
2. List of tools and technologies you used and why did you choose them
3. Your Git repository with the infrastructure and deployment automation code including a
step-by-step README.md that explains how to deploy your infrastructure
4. A demonstration of a working environment (Recorded Demo)



-----------------------------------------------------------------------------------------------
                               LIST OF TOOLS & TECHNOLOGIES
-----------------------------------------------------------------------------------------------
- terraform
- ansible
- docker
- EKS

-----------------------------------------------------------------------------------------------
                                       GIT REPOSITORY
-----------------------------------------------------------------------------------------------
https://github.com/yoni702/FinalProject.git

-----------------------------------------------------------------------------------------------
                                      NEED TO FINISH
-----------------------------------------------------------------------------------------------
vpc
2 private subnets
2 public subnets
2 availability zones (Public & Private in each az)