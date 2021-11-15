#___________________________Installing kubectl_____________________
# 1.install kubectl on Linux
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl


# 2a.(Optional) Verify the downloaded binary with the SHA-256 sum for your binary. 
curl -o kubectl.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl.sha256

# 2b. Check the SHA-256 sum for your downloaded binary.
openssl sha1 -sha256 kubectl
# 2c.Compare the generated SHA-256 sum in the command output against your downloaded SHA-256 file. The two should match. 

# 3 Apply execute permissions to the binary.
chmod +x ./kubectl

# 4 Copy the binary to a folder in your PATH. If you have already installed a version of kubectl, then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH. 
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

# 5 (Optional) Add the $HOME/bin path to your shell initialization file so that it is configured when you open a shell. 
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

# 6 After you install kubectl , you can verify its version with the following command: 
kubectl version --short --client



#___________________________Installing eksctl _________________________

# 1 Download and extract the latest release of eksctl with the following command. 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# 2 Move the extracted binary to /usr/local/bin. 
sudo mv /tmp/eksctl /usr/local/bin

# 3 Test that your installation was successful with the following command.
eksctl version


# ______________________________Deploy Kubernetes Dashboard______________________________
# Step 1: Deploy the Kubernetes dashboard
# For Regions other than Beijing and Ningxia China, apply the Kubernetes dashboard.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml