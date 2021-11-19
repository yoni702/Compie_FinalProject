#### install plugins:
    ##### Terraform:
    >> Manage Jenkins >>Manage Plugins >>Available
        - terraform
    >> Manage Jenkins >>Global Tool Configuration >>Add Terraform
        - Name: terraform_plugin
        Tip:the installer version may be the same of the terraform version installed on the Workstation to be sure it will work

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
