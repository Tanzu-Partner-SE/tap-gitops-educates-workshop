#!/bin/bash
sudo dpkg -i apt_0.8.16~exp12ubuntu10.10_i386.deb
sudo dpkg -i apt_0.8.16~exp12ubuntu10.10_amd64.deb
sudo apt update sudo apt install wget
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
