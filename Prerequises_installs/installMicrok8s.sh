
# install MicroK8s
sudo snap install microk8s --classic --channel=1.16/stable 

# make sure MicroK8s is running
sudo microk8s.status 

# you can add an alias:
sudo snap alias microk8s.kubectl kubectl 


# Sudo permisions
sudo usermod -a -G microk8s $USER

# (Enabling addons:)
# sudo microk8s.enable dns dashboard ingress 


