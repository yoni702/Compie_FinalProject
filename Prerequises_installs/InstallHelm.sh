#!/bin/bash

curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# verify the version
helm version --short

# first, add the default repository, then update
helm repo add stable https://charts.helm.sh/stable
helm repo update

# add the Bitnami Chart repo to our local list of searchable charts:
helm repo add bitnami https://charts.bitnami.com/bitnami

# let’s configure Bash completion for the helm command:
helm completion bash >> ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
source <(helm completion bash)
