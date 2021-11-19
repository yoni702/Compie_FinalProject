# This Section contains part 2 and 3 of the Final Project
This Pipeline shows how to build a EKS Cluster within VPC on East-2 
it will be populate by a web application using Kubernetes and Docker. 

#### Table of Contents
 * [Video Link](#Video)
 * [Git Repository](#Git)
 * [List of Tools & Technologies](#Technologies)
 * [Prerequisites on your Workstation](#Prerequisites)
 * [Jenkins on your Workstation](#Jenkins)
 * [If you want to check via eksctl, Dashboard](#check)


 ## Video <a id="Video"></a>
    https://github.com/yoni702/FinalProject.git

 ## Git Repository <a id="Git"></a>
    https://github.com/yoni702/FinalProject.git


 ## List of Tools & Technologies <a id="Technologies"></a>
  ### Part-2
    - Jenkins
    - Terraform
    - VPC
    - EKS (with ASG worker nodes )
    - S3 (For Remote TfState)
    - DynamoDB (For Lock TfState)

  ### Part-3
    - guestbook-go (App to deploy)
    - Docker
    - ECR
    

 ## Prerequisites on your Workstation <a id="Prerequisites"></a> 
 if needed you  will find a folder with all bashscripts instalations you dont have on your workstation (Assuming your are under Ubuntu) 

- InstallAWS.sh
- InstallDocker.sh
- InstallEksctl.sh (it include  kubectl Installation)
- InstallJenkins.sh
- InstallTerraform.sh  


## Jenkins on your Workstation <a id="Jenkins"></a>

If needed (run:InstallJenkins.sh)

### Give to jenkins Permissions
Jenkins user is added to the docker group. This will impact the security of your system;
the docker group is root equivalent
```
sudo groupadd docker
sudo usermod -aG docker jenkins
```
#### Edit the sudoers
```
sudo nano  /etc/sudoers
```
#### Paste this to give all permission to Jenkins 
```
jenkins    ALL=(ALL:ALL) ALL
%docker   ALL=(ALL:ALL) ALL
```

#### Start Jenkins
```
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
```


### Create TWO AWS Credentials:

    - Kind: Secret text
        - Secret: <Your Access Key Id>
        - ID: AWS_ACCESS_KEY_ID
    
    - Kind: Secret text
        - Secret: <Your Secret Access Key>
        - ID: AWS_SECRET_ACCESS_KEY
    
   

### Create Pipeline:
Tip: It's better not running Jenkins from a Docker images ,if so you'll need to add jenkins Plugins (Terraform ,Docker, AWS ...) to be able to run the Pipeline (And adding into the jenkinsfile tool{} section with installed plugins ) 

```
 pipeline section:
    - Pipeline script from SCM
    - SCM =  Git
    - Repository URL: https://github.com/yoni702/FinalProject.git
    - Script Path: Part_2/Jenkinsfile
```

## If you want to check via eksctl,Dashboard<a id="check"></a>

### Connect to the Cluster via eksctl

```
aws eks --region us-east-2 update-kubeconfig --name yoni-eks
```

### Check via the Dashboard
```
export DASHBOARD_VERSION="v2.0.0"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
```

#### Copy the token of the Cluster and open the proxy

```
aws eks get-token --cluster-name yoni-eks | jq -r '.status.token'
```

```
kubectl proxy --port=8081 --address=0.0.0.0 --disable-filter=true &

```
#### In your browser

```
http://127.0.0.1:8081/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```
