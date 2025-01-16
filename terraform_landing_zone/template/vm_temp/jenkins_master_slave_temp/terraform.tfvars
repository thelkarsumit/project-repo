instances = {
"sumit-jenkins-master-vm" = {
    machine_type = "e2-medium"
    zone         = "northamerica-northeast1-a"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = "NA"
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