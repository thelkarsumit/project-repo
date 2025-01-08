project_id = "shyamkprj"

instances = {
  "ansible-managed-node-1" = {
    machine_type = "e2-medium"
    zone         = "northamerica-northeast1-a"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = "NA"
  }
  "ansible-managed-node-2" = {
    machine_type = "e2-small"
    zone         = "northamerica-northeast1-a"
    image        = "debian-cloud/debian-11"
    network      = "jenkins-test-vpc"
    subnetwork   = "jenkins-test-subnetwork"
    subnetwork_project = "shyamkprj"
    metadata_startup_script = "NA"
  }
}

