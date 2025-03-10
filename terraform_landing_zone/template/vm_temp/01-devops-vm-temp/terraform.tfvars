project_id = "sumit-project-05march"

vm_name = "devops-learning-test-10march"
machine_type = "e2-medium"
zone         = "africa-south1-a"
image        = "debian-cloud/debian-11"

network = "vpc-learning-test-001"
subnetwork = "subnet-learning-test-africa-south1-public-001"
subnetwork_project = "sumit-project-05032025"

metadata_startup_script =  <<EOT
        # Update the package list
        sudo apt update

        # Install dependencies
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg

        # Jenkins Installation
        echo "Installing Jenkins..."
        wget -q -O - https://pkg.jenkins.io/jenkins.io.key | sudo apt-key add -
        sudo sh -c 'echo deb http://pkg.jenkins.io/debian/ stable main > /etc/apt/sources.list.d/jenkins.list'
        sudo apt update
        sudo apt install -y jenkins
        sudo systemctl start jenkins
        sudo systemctl enable jenkins
        echo "Jenkins installed and started."

        # Terraform Installation
        echo "Installing Terraform..."
        sudo apt-get install -y wget unzip
        wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip
        unzip terraform_1.6.0_linux_amd64.zip
        sudo mv terraform /usr/local/bin/
        terraform --version
        echo "Terraform installed."

        # Packer Installation
        echo "Installing Packer..."
        wget https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_amd64.zip
        unzip packer_1.8.0_linux_amd64.zip
        sudo mv packer /usr/local/bin/
        packer --version
        echo "Packer installed."

        # Ansible Installation
        echo "Installing Ansible..."
        sudo apt install -y ansible
        ansible --version
        echo "Ansible installed."

        # Git Installation
        echo "Installing Git..."
        sudo apt install -y git
        git --version
        echo "Git installed."

        # Docker Installation
        echo "Installing Docker..."
        sudo apt install -y docker.io
        sudo systemctl start docker
        sudo systemctl enable docker
        docker --version
        echo "Docker installed."

        # SDKMAN Installation (for managing multiple SDKs like Java, Groovy, etc.)
        echo "Installing SDKMAN..."
        curl -s "https://get.sdkman.io" | bash
        source "$HOME/.sdkman/bin/sdkman-init.sh"
        echo "SDKMAN installed."

        # Install SDK tools (Example: Java)
        echo "Installing Java SDK..."
        sdk install java 21-open
        echo "Java SDK installed."

        # Clean Up
        echo "Cleaning up..."
        sudo apt autoremove -y
        echo "Script completed."

        EOT

            
            
            
            
            
            
            
            
            
            

