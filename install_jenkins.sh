#!/bin/bash
sudo apt update -y

sudo useradd --system --no-create-home --shell /bin/false

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

 echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
  sudo apt-get install fontconfig openjdk-17-jre
  sudo apt-get install jenkins
  
pub rsa4096 2023-03-27 [SC] [expire : 2026-03-26]
      63667EE74BBA1F0A08A698725BA31D57EF5975CA
Projet Jenkins
sous rsa4096 2023-03-27 [E] [expire : 2026-03-26]

