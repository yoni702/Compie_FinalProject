## This Section contains part 2 and 3 of the final project
This Pipeline shows how to build a EKS Cluster within VPC on East-2 
it will be populate by a web application using Kubernetes and Docker. 

##### Table of Contents
 * [List of Tools & Technologies](#Technologies)
 * [Git Repository](#Git)
 * [Step Zero: Prerequisites on your Workstation](#step-zero)

 ### Git Repository <a id="Git"></a>
    https://github.com/yoni702/FinalProject.git


 ### List of Tools & Technologies <a id="Technologies"></a>
    - Terraform
    - Ansible
    - Docker
    - EKS


 ### Step Zero: Prerequisites on your Workstation <a id="step-zero"></a>
    - InstallAWS.sh 
    - InstallTerraform.sh
    - github.sh
    - InstallDocker.sh
    - InstallEksctl.sh

### Connect to Cluster via eksctl
    ```
    export DASHBOARD_VERSION="v2.0.0"

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
    ```

    ```
    http://127.0.0.1:8081/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/persistentvolume?namespace=default
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