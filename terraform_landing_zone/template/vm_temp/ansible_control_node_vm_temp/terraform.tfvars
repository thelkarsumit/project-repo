vm_name = "sumit-ansible-control-vm"
machine_type = "e2-medium"
zone         = "asia-southeast1-b"
project_id   = "my-project-amit1-415215"
image        = "debian-cloud/debian-11"
network      = "asia-southeast-sk-vpc"
subnetwork   = "southeast-sub-sk"
subnetwork_project = "southeast-sub-sk"
metadata_startup_script = <<EOT
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y ansible
EOT
