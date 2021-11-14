#!/bin/bash

cd FinalProject/Part_2

# Download jenkins 
sudo docker pull jenkins/jenkins
sudo docker run -p 11011:8080 --name=jenkins-master jenkins/jenkins
