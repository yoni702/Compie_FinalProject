#!/bin/bash


# Install Ansible
sudo apt-get update
sudo apt install ansible
sudo mkdir -p ansible

# InstallDocker.sh
curl -fsSL -o InstallDocker.sh https://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@raw.githubusercontent.com/yoni702/FinalProject/master/Prerequises_installs/InstallDocker.sh
chmod 700 InstallDocker.sh 
./InstallDocker.sh 

# InstallTerraform.sh
curl -fsSL -o InstallTerraform.sh https://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@raw.githubusercontent.com/yoni702/FinalProject/master/Prerequises_installs/InstallTerraform.sh
chmod 700 InstallTerraform.sh 
./InstallTerraform.sh 

#______Kubernetes_______

# InstallEksctl.sh EKS
curl -fsSL -o InstallEksctl.sh https://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@raw.githubusercontent.com/yoni702/FinalProject/master/Prerequises_installs/InstallEksctl.sh
chmod 700 InstallEksctl.sh 
./InstallEksctl.sh 

# installMicrok8s.sh
curl -fsSL -o installMicrok8s.sh https://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@raw.githubusercontent.com/yoni702/FinalProject/master/Prerequises_installs/installMicrok8s.sh
chmod 700 installMicrok8s.sh 
./installMicrok8s.sh 

# InstallHelm.sh
curl -fsSL -o InstallHelm.sh https://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@raw.githubusercontent.com/yoni702/FinalProject/master/Prerequises_installs/InstallHelm.sh
chmod 700 InstallHelm.sh 
./InstallHelm.sh 

