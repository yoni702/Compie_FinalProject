ansible-playbook -i <inventory-file> deploy_authorized_keys.yml --ask-pass --extra-vars='pubkey="<pubkey>"'

ansible-playbook -i inventory/hosts.aws_ec2.yaml configure_fitcycle.yml -e 'db_user=db_passord=WMware1!' -vvv


 

  
