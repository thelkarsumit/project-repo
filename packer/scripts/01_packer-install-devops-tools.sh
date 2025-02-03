#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading system packages..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Install dependencies for all tools
echo "Installing required dependencies..."
sudo apt-get install -y \
  curl \
  wget \
  unzip \
  apt-transport-https \
  ca-certificates \
  lsb-release \
  software-properties-common \
  gnupg2 \
  python3-pip \
  python3-dev

# Install Terraform
echo "Installing Terraform..."
TERRAFORM_VERSION="1.5.3"  # Specify the version of Terraform
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
terraform -v

# Install Jenkins
echo "Installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian/ $(lsb_release -cs) main > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
jenkins -v

# Install Maven
echo "Installing Maven..."
sudo apt-get install -y maven
mvn -v

# Install Ansible
echo "Installing Ansible..."
sudo apt-get install -y ansible
ansible --version

# Install Packer
echo "Installing Packer..."
PACKER_VERSION="1.9.4"  # Specify the version of Packer
wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
sudo unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm packer_${PACKER_VERSION}_linux_amd64.zip
packer -v

# Install Git
echo "Installing Git..."
sudo apt-get install -y git
git --version

# Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version

# Install Kubernetes Commands (kubectl)
echo "Installing kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# Install Google Cloud SDK
echo "Installing Google Cloud SDK..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update -y
sudo apt-get install -y google-cloud-sdk
gcloud --version

# Clean up
echo "Cleaning up..."
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

echo "Installation complete. All DevOps tools installed successfully!"
