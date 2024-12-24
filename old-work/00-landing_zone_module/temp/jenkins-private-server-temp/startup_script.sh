#!/bin/bash
sudo yum update -y
wait 10 

sudo yum install wget -y 
wait 10

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
wait 10 

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
wait 10

sudo yum upgrade -y 
wait 10 

# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk -y 
wait 10

sudo yum install jenkins -y
wait 10

sudo systemctl daemon-reload
wait 10

sudo systemctl enable jenkins
wait 10

sudo systemctl start jenkins
wait 10

sudo systemctl status jenkins



