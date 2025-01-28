vm_name = "sumit-ansible-control-vm1"
machine_type = "e2-medium"
zone         = "us-east1-a"
project_id   = "my-project-amit1-415215"
image        = "debian-cloud/debian-11"
network      = "default"
subnetwork   = "subnet1"
subnetwork_project = "subnet1"
metadata_startup_script = <<EOT
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y ansible
EOT
