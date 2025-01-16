instances = {
"sumit-jenkins-master-vm" = {
    machine_type = "e2-medium"
    zone         = "northamerica-northeast1-a"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
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
  }
"sumit-jenkins-slave-vm" = {
    machine_type = "e2-medium"
    zone         = "northamerica-northeast1-a"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = <<EOT
            #!/bin/bash
            sudo apt update
            sudo apt install -y openjdk-11-jdk
            EOT
  } 
}
project_id = "shyamkprj"