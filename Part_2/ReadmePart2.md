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
    - github.sh
    - InstallEksctl.sh
    - snap install kubectl --classic


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
    ##### Terraform:
    >> Manage Jenkins >>Manage Plugins >>Available
        - terraform
    >> Manage Jenkins >>Global Tool Configuration >>Add Terraform
        - Name: terraform_plugin
        Tip:the installer version may be the same of the terraform version installed on the Workstation to be sure it will work
    ##### Kubernetes:
     >> Manage Jenkins >>Manage Plugins >>Available
        - Kubernetes Continuous Deploy Plugin
    ##### Docker:
    -Docker
    -Docker pipeline

#### Create TWO AWS Credentials:

    - Kind: Secret text
        - Secret: <Your Access Key Id>
        - ID: AWS_ACCESS_KEY_ID
    
    - Kind: Secret text
        - Secret: <Your Secret Access Key>
        - ID: AWS_SECRET_ACCESS_KEY
    
   

#### Create Pipeline:
 pipeline section:
    - Pipeline script from SCM
    - SCM =  Git
    - Repository URL: https://github.com/yoni702/FinalProject.git
    - Script Path: Part_2/Jenkinsfile

### Connect to Cluster via eksctl
```
aws configure
    AWS Access Key ID [None]: <Your Access Key Id>
    AWS Secret Access Key [None]: <Your Secret Access Key>
    Default region name [None]: us-east-2
    Default output format [None]: json
```

```
aws eks --region us-east-2 update-kubeconfig --name yoni-eks
```

### Connect Cluster to Jenkins
```
sudo cat ~/.kube/config
```


### Dashboard
```
export DASHBOARD_VERSION="v2.0.0"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
```

```
kubectl proxy --port=8081 --address=0.0.0.0 --disable-filter=true &

```
-In your browser
```
http://127.0.0.1:8081/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```

```
aws eks get-token --cluster-name yoni-eks | jq -r '.status.token'
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