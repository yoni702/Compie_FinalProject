#### install plugins:
    ##### Terraform:
    >> Manage Jenkins >>Manage Plugins >>Available
        - terraform
    >> Manage Jenkins >>Global Tool Configuration >>Add Terraform
        - Name: terraform_plugin
        Tip:the installer version may be the same of the terraform version installed on the Workstation to be sure it will work

## Jenkins on your Workstation <a id="Jenkins"></a>
    apt  install docker-compose
    curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-jenkins/master/docker-compose.yml > docker-compose.yml
    docker-compose up -d
     - Port: 8080
     - Username: user
     - Password: bitnami
    
    #docker pull bitnami/jenkins:latest
    #sudo docker pull jenkins/jenkins
    #sudo docker run -d -p 11011:8080 --name=jenkins-master jenkins/jenkins

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
awk '/value": "apiVersion/ {print}' app-state > newlj.txt
cat newlj.txt | sed 's/\\n/\n/g' > output_file.txt

sudo cat ~/.kube/config
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
