## This Section contains part 2 and 3 of the final project
This Pipeline shows how to build a EKS Cluster within VPC on East-2 
it will be populate by a web application using Kubernetes and Docker. 

##### Table of Contents
 * [List of Tools & Technologies](#Technologies)
 * [Git Repository](#Git)
 * [Prerequisites on your Workstation](#Prerequisites)
 * [Jenkins on your Workstation](#Jenkins)

 ### Git Repository <a id="Git"></a>
    https://github.com/yoni702/FinalProject.git


 ### List of Tools & Technologies <a id="Technologies"></a>
    - Terraform
    - Ansible
    - Docker
    - EKS


 ### Prerequisites on your Workstation <a id="Prerequisites"></a> 
 if needeed you  will find a folder with all bashscripts instalation you dont have on your workstation (Assuming your are under Ubuntu) 
    - InstallAWS.sh 
    - InstallDocker.sh
    - InstallTerraform.sh
    - github.sh
    - InstallEksctl.sh


### Jenkins on your Workstation <a id="Jenkins"></a>
    apt  install docker-compose
    curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-jenkins/master/docker-compose.yml > docker-compose.yml
    docker-compose up -d
     - Port: 80
     - Username: user
     - Password: bitnami
    
    #docker pull bitnami/jenkins:latest
    #sudo docker pull jenkins/jenkins
    #sudo docker run -d -p 11011:8080 --name=jenkins-master jenkins/jenkins

#### install plugins:
    - terraform
    name it "terraform_plugin" in "Global Tool Configuration" 

#### Create Credentials:
    - aws

#### Create Pipeline:
 pipeline section:
    - Pipeline script from SCM
    - SCM =  Git
    - Repository URL: https://github.com/yoni702/FinalProject.git
    - Script Path: Part_2/Jenkinsfile



### Connect to Cluster via eksctl
```
aws eks --region <region-code> update-kubeconfig --name <cluster_name>
```


### Dashboard
```
export DASHBOARD_VERSION="v2.0.0"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
```

```
http://127.0.0.1:8081/api/v1/namespaces/kubernetes-dashboard/services https:kubernetes-dashboard:/proxy/#/persistentvolume?namespace=default
```

```
aws eks get-token --cluster-name yoni-eks-hnOh7i8m
```


### Deploy
```
kubectl create -f redis-master-controller.json
kubectl create -f redis-master-service.json
kubectl create -f redis-slave-controller.json
kubectl create -f redis-slave-service.json
kubectl create -f guestbook-controller.json
kubectl create -f guestbook-service.json
```