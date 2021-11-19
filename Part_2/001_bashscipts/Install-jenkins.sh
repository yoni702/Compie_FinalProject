#!/bin/bash

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

#install java
sudo apt update
sudo apt install openjdk-11-jdk
java -version

#Start jenkins
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins

#Give to jenkins permissions
# user is added to the docker group. This will impact the security of your system; the docker group is root equivalent
sudo groupadd docker
sudo usermod -aG docker jenkins

# sudo nano  /etc/sudoers
# jenkins    ALL=(ALL:ALL) ALL
# %docker   ALL=(ALL:ALL) ALL
# Restart Jenkins