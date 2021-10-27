Part 3 - Deploy application on EKS
Objectives
1. Look for any application that includes frontend and backend. You can choose any popular GitHub application to dockerize (fronted & backend) or just a demo/sample application in any other source
2. Create ECR for your application images
3. Create a pipeline with your preferred open source CI/CD tool that builds a container
image for the application and pushes it to your ECR
4. Create a pipeline with your preferred open source CI/CD tool that deploys your
application images to the EKS cluster
5. Make your application accessible using the ingress of your choice
Notes for part 3

1. You can use any custom application that you find that consists of at least two microservices, it can also be your own application.
2. You should use only Open Source tools and not cloud proprietary CI/CD tools
You answer should include:
1. Overview of your solution. (Architecture diagram can be included)
2. List of tools and technologies you used and why did you choose them
3. Your Git repository with the infrastructure and deployment automation code including a
step-by-step README.md that explains how to deploy your infrastructure
4. The pipelines that you created in this Part should be saved in your repository
5. A demonstration of a working environment (Recorded Demo)
      




-----------------------------------------------------------------------------------------------
                               LIST OF TOOLS & TECHNOLOGIES
-----------------------------------------------------------------------------------------------
- terraform
- ansible
- docker
- ECR

-----------------------------------------------------------------------------------------------
                                       GIT REPOSITORY
-----------------------------------------------------------------------------------------------
https://github.com/yoni702/FinalProject.git

-----------------------------------------------------------------------------------------------
                                      NEED TO FINISH
-----------------------------------------------------------------------------------------------
frontend and backend
2 microservices
vpc
2 private subnets
2 public subnets
2 availability zones (Public & Private in each az)