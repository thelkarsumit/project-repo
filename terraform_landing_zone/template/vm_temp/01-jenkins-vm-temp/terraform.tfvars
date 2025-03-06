project_id = "sumit-project-05032025"

vm_name = "jenkins-learning-test-0603"
machine_type = "e2-medium"
zone         = "africa-south1-a"
image        = "debian-cloud/debian-11"

network = "vpc-learning-test-001"
subnetwork = "subnet-learning-test-africa-south1-public-001"
subnetwork_project = "sumit-project-05032025"

metadata_startup_script =  <<EOT
            #!/bin/bash
            sudo apt update
            sudo apt install -y openjdk-11-jdk
            curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
            echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
            sudo apt update
            sudo apt install -y jenkins
            sudo systemctl start jenkins
            sudo systemctl enable jenkins
            EOT

