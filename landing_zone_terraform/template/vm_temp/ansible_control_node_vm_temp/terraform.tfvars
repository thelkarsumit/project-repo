vm_name = "sumit-ansible-control-vm"
machine_type = "e2-medium"
zone         = "northamerica-northeast1-a"
project_id   = "shyamkprj"
image        = "debian-cloud/debian-11"
network      = "jenkins-test-vpc"
subnetwork   = "jenkins-test-subnetwork"
subnetwork_project = "shyamkprj"
metadata_startup_script = <<EOT
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y ansible
EOT
